#!/usr/bin/env python3
# Lightweight PAC file HTTP server for local network proxy distribution
import http.server
import socketserver

PORT = 8088
DIRECTORY = "/opt/pac"

class PACRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

    def guess_type(self, path):
        if path.endswith(".pac"):
            return "application/x-ns-proxy-autoconfig"
        return super().guess_type(path)

    def log_message(self, format, *args):
        pass

if __name__ == "__main__":
    socketserver.TCPServer.allow_reuse_address = True
    with socketserver.TCPServer(("0.0.0.0", PORT), PACRequestHandler) as httpd:
        httpd.serve_forever()
