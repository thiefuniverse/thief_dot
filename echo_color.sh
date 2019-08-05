#!/bin/bash 


BLUE='\033[0;34m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo_green(){
    echo -e "${GREEN}${@}${NC}"
}
green_t(){
    echo "${GREEN}${@}${NC}"
}

echo_blue(){
    echo -e "${BLUE}${@}${NC}"
}

blue_t(){
    echo -e "${BLUE}${@}${NC}"
}
echo_yellow(){
    echo -e "${YELLOW}${@}${NC}"
}

yellow_t(){
    echo -e "${YELLOW}${@}${NC}"
}
echo_red(){
    echo -e "${RED}${@}${NC}"
}
red_t() {
    echo -e "${RED}${@}${NC}"
}
alias echo="echo -e"

echo_yellow "thiefunvierse"
echo_yellow "univer"
echo -e "`green_t thief`"
