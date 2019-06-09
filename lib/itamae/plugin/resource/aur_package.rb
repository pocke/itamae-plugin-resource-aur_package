require 'itamae'

module Itamae
  module Plugin
    module Resource
      class AurPackage < ::Itamae::Resource::Base
        class NotSupportedError < StandardError
          def initialize(os)
            @os = os
          end

          def message
            "AurPackage only supports Arch Linux, but it is #{@os[:family]}"
          end
        end

        define_attribute :action, default: :install
        define_attribute :name, type: String, default_name: true
        define_attribute :options, type: String
        define_attribute :version, type: String

        def run
          os = backend.instance_variable_get(:@backend).os_info
          raise NotSupportedError.new(os) unless os[:family] == 'arch'

          super
        end

        def pre_action
          case @current_action
          when :install
            attributes.installed = true
          when :remove
            attributes.installed = false
          end
        end

        def set_current_attributes
          current.installed = run_specinfra(:check_package_is_installed, attributes.name)

          if current.installed
            current.version = run_specinfra(:get_package_version, attributes.name).stdout.strip
          end
        end

        def action_install(action_options)
          if run_specinfra(:check_package_is_installed, attributes.name, attributes.version)
            return
          end

          yay_executable = run_command('which yay', error: false).exit_status == 0
          if yay_executable
            run_command("yay -S --noconfirm #{attributes.options} #{attributes.name}")
          else
            name = attributes.name
            tmp_dir = "/tmp/itamae-plugin-resource-aur_package-#{name}-#{Time.now.to_f}"
            run_command("mkdir #{tmp_dir}")
            run_command("curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/#{name}.tar.gz", cwd: tmp_dir)
            run_command("tar -xvf #{name}.tar.gz", cwd: tmp_dir)
            run_command("makepkg -si --noconfirm #{attributes.options}", cwd: "#{tmp_dir}/#{name}" )
            run_command("rm -rf #{tmp_dir}")
          end
          updated!
        end

        def action_remove(action_options)
          if run_specinfra(:check_package_is_installed, attributes.name, nil)
            run_specinfra(:remove_package, attributes.name, attributes.options)
            updated!
          end
        end
      end
    end
  end
end
