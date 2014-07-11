

#product="hao123"
#product=$1
products="hao123 hiphotos im sf jpaas nova ps www storm"
for p in ${products}; do
  echo "begin to delete ${p}"
  for ((i=120; i>30; i--)); do
    d=`date +%Y-%m-%d -d "${i} day ago"`
    index="aqueducts_${p}_${d}"
    curl -XDELETE "http://10.36.4.246:8200/${index}/" >/dev/null 2>&1 
  done
  echo "done"
  echo "================================================="
  sleep 10s
done


