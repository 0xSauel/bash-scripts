cd ~/Documents &&
rm -r Count_result.csv || : &&
rm -r Count || : &&
mkdir ~/Documents/Count &&
mv Count.csv ~/Documents/Count/ &&
cd ~/Documents/Count &&
split -l 80000 -d --additional-suffix=.csv Count.csv 80k &&
mv Count.csv ~/Documents/ &&
grep -h -rc "Базовая" | awk '{ SUM += $1} END { print "Базовая:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "Фото 112013" | awk '{ SUM += $1} END { print "Фото 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "Лайт 112013" | awk '{ SUM += $1} END { print "Лайт 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -r -v "Smart" | grep -v "Промо" | grep -v "корп. промо" | grep -v "подарок" | grep -h -c -F "Стандарт" | awk '{ SUM += $1} END { print "Стандарт:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "Полная 112013" | awk '{ SUM += $1} END { print "Полная 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "Фото+Контакты 112013" | awk '{ SUM += $1} END { print "Фото+Контакты 112013:," SUM }' | tee -a ~/Documents/Count_result.csv &&
grep -r -v "подарок" | grep -v "промо" | grep -h -c -F "Оптимум" | awk '{ SUM += $1} END { print "Оптимум:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "10 ГБ 112013" | awk '{ SUM += $1} END { print "10 ГБ 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -r -v "промо" | grep -h -c -F "Премиум" | awk '{ SUM += $1} END { print "Премиум:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "10,0001 ГБ 112013" | awk '{ SUM += $1} END { print "10.0001 ГБ 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "30 ГБ 112013" | awk '{ SUM += $1} END { print "30 ГБ 112013:," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc -F "LITE-MINI" | awk '{ SUM += $1} END { print "LITE-MINI:," SUM }' | tee -a ~/Documents/Count_result.csv && 
printf "\n----------,------------\n\n" >> ~/Documents/Count_result.csv
grep -h -rc -F "Стандарт (Smart)" | awk '{ SUM += $1} END { print "Стандарт (Smart):," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc -F "Стандарт (промо)" | awk '{ SUM += $1} END { print "Стандарт (промо):," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc -F "Стандарт (корп. промо)" | awk '{ SUM += $1} END { print "Стандарт (корп. промо):," SUM }' | tee -a ~/Documents/Count_result.csv && 
grep -h -rc "Стандарт (подарок)" | awk '{ SUM += $1} END { print "Стандарт (подарок):," SUM }' | tee -a ~/Documents/Count_result.csv &&
grep -h -rc "Оптимум (подарок)" | awk '{ SUM += $1} END { print "Оптимум (подарок):," SUM }' | tee -a ~/Documents/Count_result.csv &&
grep -h -rc "Оптимум (промо)" | awk '{ SUM += $1} END { print "Оптимум (промо):," SUM }' | tee -a ~/Documents/Count_result.csv &&
grep -h -rc -F "Премиум (промо)" | awk '{ SUM += $1} END { print "Премиум (промо):," SUM }' | tee -a ~/Documents/Count_result.csv &&
#Second Task
grep -h -r -F "Стандарт (Smart)" | cut -d',' -f1 | tee -a ~/Documents/Number_list.csv

cd ~/Documents &&
rm -r Count &&
echo "Done!"


