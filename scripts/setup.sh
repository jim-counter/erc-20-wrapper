#!/bin/bash

# WAI3 Contract Setup Script
# This script helps set up the environment for WAI3 deployment

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Setting up WAI3 Contract Environment${NC}"
echo ""

# Check if .env already exists
if [ -f .env ]; then
    echo -e "${YELLOW}⚠️  .env file already exists${NC}"
    echo "Do you want to overwrite it? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Setup cancelled."
        exit 0
    fi
fi

# Copy .env.example to .env
echo -e "${BLUE}📁 Creating .env file from template...${NC}"
cp .env.example .env

echo -e "${GREEN}✅ .env file created!${NC}"
echo ""
echo -e "${YELLOW}📝 Please edit .env file with your configuration:${NC}"
echo "1. Set your PRIVATE_KEY"
echo "2. Adjust RPC/Explorer URLs if needed"
echo "3. Set CHRONOS_API_KEY if you have one"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Edit .env with your settings: nano .env"
echo "2. Run deployment: ./scripts/deploy.sh"
echo ""
echo -e "${GREEN}🎉 Setup complete!${NC}"
