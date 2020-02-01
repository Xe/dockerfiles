FROM dhall:5p7i6hxcc7w80s23yfb2pbvm7ds659na AS dhall
FROM dhall-bash:nh9cn93vkqnasqccz93yc3p7jb8iip51 AS dhall-bash
FROM dhall-json:jiq427d3b7w27rzzlk9911mhmsnj7laj AS dhall-json
FROM dhall-yaml:8wrbqg5b52b05l2ksylcjfkgkcf7dw8b AS dhall-yaml
FROM dhall-lsp-server:9hlr4g5h1nibjaix3w1hqv4g6pj06kpi AS dhall-lsp
FROM xena/alpine
COPY --from=dhall /bin/dhall /usr/local/bin/dhall
COPY --from=dhall-bash /bin/dhall-to-bash /usr/local/bin/dhall-to-bash
COPY --from=dhall-json /bin/dhall-to-json /usr/local/bin/dhall-to-json
COPY --from=dhall-json /bin/json-to-dhall /usr/local/bin/json-to-dhall
COPY --from=dhall-yaml /bin/dhall-to-yaml-ng /usr/local/bin/dhall-to-yaml
COPY --from=dhall-lsp /bin/dhall-lsp-server /usr/local/bin/dhall-lsp-server
