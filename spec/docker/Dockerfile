FROM archlinux/base:latest

RUN pacman -Syy
RUN pacman -S --noconfirm base-devel which tar sudo git go

RUN useradd -m -g users -s /bin/sh ordinary

RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ordinary
