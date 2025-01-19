curl -LO https://raw.githubusercontent.com/awadheshk/herolab/refs/heads/main/P079.sh
sudo chmod +x P079.sh
./P079.sh

export REGION=us-central1

gsutil -m cp -r gs://spls/gsp067/python-docs-samples .
cd python-docs-samples/appengine/standard_python3/hello_world

cat > requirements.txt <<EOF_END
Flask==1.1.2
itsdangerous==2.0.1
Jinja2==3.0.3
werkzeug==2.0.1
EOF_END

cat > app.yaml <<EOF_END
runtime: python39
EOF_END

gcloud app create --region=$REGION

gcloud app deploy --quiet 

gcloud services enable websecurityscanner.googleapis.com
