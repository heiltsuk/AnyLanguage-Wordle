#!/bin/bash

main() {
  echo '' > 01-raw.txt

  for i in $(seq 1 787); do
    echo "Processing $i..."
    curl -s https://dictionary.nishnaabemwin.atlas-ling.ca/words/index/page:$i.json | jq -r '.words[] | .Word.nishnaabemwin' >> 01-raw.txt
  done

  cat 01-raw.txt | sed -e 's/aa/A/g' | sed -e 's/ii/I/g' | sed -e 's/oo/O/g' | sed -e 's/ch/C/g' | sed -e 's/sh/S/g' | sed -e 's/zh/Z/g' | sed -e 's/nh/N/g' > 02-replaced.txt
}

main

cat xxx | sed -e 's/gv/G/g' | sed -e 's/kv/K/g' | sed -e 's/k̓v/V/g' | sed -e 's/xv/X/g' | sed -e 's/ǧv/G/g' | sed -e 's/qv/Q/g' | sed -e 's/q̓v/0/g' | sed -e 's/x̌v/Z/g' 
cat xxx | sed -e 's/G/gv/g' | sed -e 's/K/kv/g' | sed -e 's/V/k̓v/g' | sed -e 's/X/xv/g' | sed -e 's/G/ǧv/g' | sed -e 's/Qqv/g' | sed -e 's/0/q̓v/g' | sed -e 's/Z/x̌v/g' 