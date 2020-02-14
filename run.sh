time=$(date "+%Y-%m-%d_%H:%M:%S")
horovodrun -np $1 python -m main | tee ${time}_out.log
# horovodrun -np $1 python main.py
