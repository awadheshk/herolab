######
curl -LO https://raw.githubusercontent.com/awadheshk/herolab/refs/heads/main/064.sh

sudo chmod +x 064.sh

./064.sh
===============
export USERNAME_2=
gsutil mb -l us -b on gs://$DEVSHELL_PROJECT_ID
echo "subscribe to quicklab " > sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID

gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USERNAME_2 \
  --role=roles/viewer

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USERNAME_2 \
  --role=roles/storage.objectViewer
