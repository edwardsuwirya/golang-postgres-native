package main

import (
	"database/sql"
)

type Customer struct {
	CustomerId    uint   `db:"customer_id"`
	MobilePhoneNo string `db:"mobile_phone_no"`
	Name          string
	ActiveMember  bool         `db:"active_member"`
	JoinDate      sql.NullTime `db:"join_date"`
}
