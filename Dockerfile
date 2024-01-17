# Copyright 2024 仲夏叶.
# SPDX-License-Identifier: MIT

FROM alpine:latest AS builder

RUN apk upgrade --no-cache \
    && apk add --no-cache cargo \
    && cargo install tlrc

RUN /root/.cargo/bin/tldr --gen-config | head -n 6 | tee $(/root/.cargo/bin/tldr --config-path) \
    && sed -i 's/true/false/g' /root/.config/tlrc/config.toml \
    && sed -i 's/languages = \[\]/languages = \["zh", "en"\]/g' /root/.config/tlrc/config.toml \
    && /root/.cargo/bin/tldr --update --quiet

FROM alpine:latest

COPY --from=builder --chmod=755 /root/.cargo/bin/tldr /usr/bin/tldr
COPY --from=builder --chmod=644 /root/.cache/tlrc /root/.cache/tlrc/
COPY --from=builder --chmod=644 /root/.config/tlrc/config.toml /root/.config/tlrc/config.toml

RUN apk add --no-cache libgcc

ENTRYPOINT ["tldr"]
CMD ["--help"]
