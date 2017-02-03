#!/bin/bash

# @author Drew Chapin
# @date   July 26th, 2016
# @brief  Bash script to add missing file extensions based on MIME type. 

for f in $(ls -1 | sed -e 's/\..*$//'); do
	if [[ $(file --mime-type "$f" | grep image/jpeg) ]]; then mv "$f" "$f.jpg"; fi
	if [[ $(file --mime-type "$f" | grep image/png) ]]; then mv "$f" "$f.png"; fi
	if [[ $(file --mime-type "$f" | grep application/xml) ]]; then mv "$f" "$f.xml"; fi
	if [[ $(file --mime-type "$f" | grep video/quicktime) ]]; then mv "$f" "$f.mp4"; fi
	if [[ $(file --mime-type "$f" | grep text/plain) ]]; then mv "$f" "$f.txt"; fi
done