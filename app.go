package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

func main() {
	dbHost := "167.172.69.254"
	dbPort := "5432"
	dbUser := "smm2"
	dbPassword := "SmmBatchTwo"
	dbName := "smm2"
	dataSourceName := fmt.Sprintf("postgres://%s:%s@%s:%s/%s", dbUser, dbPassword, dbHost, dbPort, dbName)
	db, err := sqlx.Connect("postgres", dataSourceName)
	if err != nil {
		panic(err)
	}
	defer func(conn *sqlx.DB) {
		err := conn.Close()
		if err != nil {
			panic(err)
		}
	}(db)

	//01. Tarik data customer yang status nya active member
	//var customers []Customer
	//err = db.Select(&customers, "SELECT customer_id,mobile_phone_no,name,active_member,join_date FROM wmb.m_customer WHERE active_member=$1", true)
	//if err != nil {
	//	fmt.Println(err)
	//}
	//fmt.Println(customers)

	//02. Tarik data customer berdasarkan ID (Single result)
	//var customer Customer
	//err = db.Get(&customer, "SELECT customer_id,mobile_phone_no,name,active_member,join_date FROM wmb.m_customer WHERE customer_id=$1", 3)
	//if err != nil {
	//	fmt.Println(err)
	//}
	//fmt.Println(customer)

	//03. Tarik Data dengan Null
	//Struct field mesti bertipe data pointer / sql.Null*
	//var customers []Customer
	//err = db.Select(&customers, "SELECT customer_id,mobile_phone_no,name,active_member,join_date FROM wmb.m_customer WHERE active_member=$1", false)
	//if err != nil {
	//	fmt.Println(err)
	//}
	//fmt.Println(customers[0].JoinDate.Time)

	//04. Select Join
	//type CustomerCred struct {
	//	CustomerId uint   `db:"customer_id"`
	//	PhoneNo    string `db:"mobile_phone_no"`
	//	Name       string
	//	UserName   string `db:"user_name"`
	//}
	//rows, err := db.Queryx("SELECT customer_id,mobile_phone_no,name,user_name FROM wmb.m_customer c JOIN wmb.user_credentials u ON c.user_credential_id=u.id WHERE active_member=TRUE")
	//
	//var customerCreds []CustomerCred
	//for rows.Next() {
	//	var c CustomerCred
	//	err := rows.StructScan(&c)
	//	if err != nil {
	//		log.Fatalln(err)
	//	}
	//	customerCreds = append(customerCreds, c)
	//}
	//
	//fmt.Println(customerCreds)

	//04. Aggregation
	var customerCount int
	err = db.Get(&customerCount, "SELECT count(customer_id) FROM wmb.m_customer WHERE active_member=true")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(customerCount)

	var ActiveMemberCount []struct {
		ActiveMember bool `db:"active_member"`
		Total        int
	}
	err = db.Select(&ActiveMemberCount, "SELECT active_member,count(customer_id) as Total FROM wmb.m_customer group by active_member")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(ActiveMemberCount)

	//05. Create data customer baru
	//_, err = db.NamedExec(`INSERT INTO wmb.m_customer (mobile_phone_no,name) VALUES (:phone,:name)`,
	//	map[string]interface{}{
	//		"phone": "08777112113",
	//		"name":  "Joni",
	//	})
	//if err != nil {
	//	fmt.Println(err)
	//}

	//06. Transactional
	//tx := db.MustBegin()
	//defer func() {
	//	if err := recover(); err != nil {
	//		fmt.Println(err)
	//	}
	//}()
	//tx.MustExec(`INSERT INTO wmb.m_customer (mobile_phone_no,name,active_member) VALUES ($1,$2,$3)`,
	//	"08777112114", "Pa Eko", false)
	//tx.MustExec(`INSERT INTO wmb.m_customer (mobile_phone_no,name,active_member) VALUES ($1,$2,$3)`,
	//	112, "Mas Budi", 8)
	//tx.Commit()

}
