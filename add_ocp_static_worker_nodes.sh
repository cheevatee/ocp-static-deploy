export CLUSTER_DOMAIN=ocp4.example.com
export ORI_IGNITION_FILE=/var/www/html/worker01.ign
export NEW_IGNITION_FILE=/var/www/html/add_worker_nodes.ign
export MCS=api-int.$CLUSTER_DOMAIN:22623
export API_INIT_CERT=$(openssl s_client -connect $MCS -showcerts </dev/null 2>/dev/null|openssl x509 -outform PEM | base64 --wrap=0)
cp $ORI_IGNITION_FILE $NEW_IGNITION_FILE
sed --regexp-extended --in-place=.backup "s%base64,[^,]+%base64,$(echo $API_INIT_CERT)\"%" $NEW_IGNITION_FILE
