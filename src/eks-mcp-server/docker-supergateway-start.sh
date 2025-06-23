#!/bin/sh

# Build MCP server command with conditional flags
MCP_CMD="python -m awslabs.eks_mcp_server.server"

if [ "$MCP_ALLOW_WRITE" = "true" ]; then
    MCP_CMD="$MCP_CMD --allow-write"
fi

if [ "$MCP_ALLOW_SENSITIVE_DATA" = "true" ]; then
    MCP_CMD="$MCP_CMD --allow-sensitive-data-access"
fi

# Run supergateway with the constructed command
exec supergateway --stdio "$MCP_CMD" --port "$SUPERGATEWAY_PORT"