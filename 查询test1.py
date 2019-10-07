from pymysql import *


class JD(object):
    def __init__(self):
        self.conn = connect(host="localhost", port=3306, user="root",
                            password="123456", database="jing_dong",
                            charset="utf8")
        self.cs = self.conn.cursor()

    def __del__(self):
        self.conn.close()
        self.cs.close()

    def show_all(self):
        self.cs.execute("select * from goods;")
        for item in self.cs.fetchall():
            print(item)

    def show_cate(self):
        self.cs.execute("select name from goods_cates;")
        for item in self.cs.fetchall():
            for name in item:
                print(name)

    def show_brand(self):
        self.cs.execute("select name from brands;")
        for item in self.cs.fetchall():
            for name in item:
                print(name)

    def get_info_by_name(self):
        name = input("查询的商品名：")
        sql = """select * from goods where name='{}';""".format(name)
        self.cs.execute(sql)
        print(self.cs.fetchall())

    def add_cate(self):
        brand = input("输入品牌名称：")
        self.cs.execute("""insert into brands (name) values("{}");""".format(brand))
        self.conn.commit()

    def run(self):
        while True:
            str_call = input("请输入请求（1.查询所有信息，2.查询所有分类，3.查询所有品牌，4.添加商品品牌，5.根据名字查询商品）：")

            if str_call == "1":
                self.show_all()
            elif str_call == "2":
                self.show_cate()
            elif str_call == "3":
                self.show_brand()
            elif str_call == "4":
                self.add_cate()
            elif str_call == "5":
                self.get_info_by_name()
            else:
                print("输入错误")


def main():
    jd = JD()
    jd.run()


if __name__ == '__main__':
    main()
