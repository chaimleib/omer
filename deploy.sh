echo Downloading https://github.com/Yossi/omer/archive/pythonanywhere.zip
curl -L -O https://github.com/Yossi/omer/archive/pythonanywhere.zip
echo Unzipping...
unzip pythonanywhere.zip
unzip -z pythonanywhere.zip | sed -n 2p > omer-pythonanywhere/version.hash
rm pythonanywhere.zip
echo Deleted pythonanywhere.zip
rm -rf omer
mv omer-pythonanywhere omer
echo Updated omer/
mv omer/deploy.sh deploy.sh
echo Updated deploy.sh
cd omer
source virtualenvwrapper.sh
workon omer
echo Virtualenv omer activated
pip install -U --upgrade-strategy only-if-needed -r requirements.txt
echo Attempting to list outdated packages:
pip list --outdated
rm -rf ../.cache
rm -rf .github/
rm .gitignore
rm requirements.txt
echo Done. Now go reload site from the Web tab.
