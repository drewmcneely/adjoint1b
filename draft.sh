#!/usr/bin/bash

    sed 's/\\\[/\$\$/g; 
        s/\\\]/\$\$/g; 
        s/\\coloneqq/:=/g' $1 \
    | pandoc - -o draft_out.pdf
