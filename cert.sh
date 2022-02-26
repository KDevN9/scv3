systemctl stop vmess-grpc
sudo apt install software-properties-common -y > /dev/null 2>&1
sudo add-apt-repository ppa:certbot/certbot -y > /dev/null 2>&1
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1
sudo apt-get install certbot -y /dev/null 2>&1
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email kdevn9@gmail.com -d $1
rm -f /etc/xray/xray.crt
rm -f /etc/xray/xray.key
sudo ln -s /etc/letsencrypt/live/*/fullchain.pem /etc/xray/xray.crt
sudo ln -s /etc/letsencrypt/live/*/privkey.pem /etc/xray/xray.key
domain=$(cat /etc/xray/domain)
rm -f /etc/xray/xray.crt
rm -f /etc/xray/xray.key
export new1=/etc/xray/xray.crt
export new2=/etc/xray/xray.key
export old1=/root/.acme.sh/${domain}_ecc/fullchain.cer
export old2=/root/.acme.sh/${domain}_ecc/fullchain.key
systemctl start vmess-grpc.service
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vlessgrpc.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vmessgrpc.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/trojangrpc.json
sed -i "s/$old2/$new2/g" /etc/xray/vlessgrpc.json
sed -i "s/$old2/$new2/g" /etc/xray/vmessgrpc.json
sed -i "s/$old2/$new2/g" /etc/xray/trojangrpc.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vmesstls.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vmessnone.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vlesstls.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/vlessnone.json
sed -i "s//root/.acme.sh/${domain}_ecc/fullchain.cer/$new1/g" /etc/xray/trojan.json
sed -i "s/$old2/$new2/g" /etc/xray/vmesstls.json
sed -i "s/$old2/$new2/g" /etc/xray/vmessnone.json
sed -i "s/$old2/$new2/g" /etc/xray/vlesstls.json
sed -i "s/$old2/$new2/g" /etc/xray/vlessnone.json
sed -i "s/$old2/$new2/g" /etc/xray/trojan.json