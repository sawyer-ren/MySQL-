from pymysql import *

conn = connect(host="localhost", port=3306, user="root",
               password="123456", database="jing_dong",
               charset="utf8")
cs = conn.cursor()

for i in range(100000):
    cs.execute("insert into test_index values('ha-{}')".format(i))

conn.commit()
