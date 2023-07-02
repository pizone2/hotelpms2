
:octocat: [Main](/)
> Trouble Shooting

## 객실현황
- 간트차트의 테이블 고장
  -  Mapper 수정으로 문제 해결




#### 간트차트의 테이블 고장
- 테이블이 일정 부분만 구현되는 문제 발생
```sql
 SELECT
        a.ROOMTYPE,
        a.ROOMNUMBER,
        DATE(a.RESERVATIONDATE) AS reservationDate,
        CASE
        WHEN b.ROOMNUMBER IS NULL THEN NULL
        ELSE MAX(CASE
        WHEN a.ROOMSTATUS = '예약완료' THEN '예약완료'
        WHEN a.ROOMSTATUS = '재실' THEN '재실'
        WHEN a.ROOMSTATUS = '퇴실' THEN '퇴실'
        ELSE 0
        END)
        END AS roomStatus,
        b.NAME,
        b.RESERVATIONNUMBER,
        b.PHONENUMBER,
        b.CHECKINDATE,
        b.CHECKOUTDATE
        FROM
        RESERVED a
        LEFT JOIN
        BOOKING b ON a.ROOMNUMBER = b.ROOMNUMBER
        AND DATE(a.RESERVATIONDATE) >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
        AND DATE(a.RESERVATIONDATE) &lt; DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 1 DAY), INTERVAL 2 WEEK)
        AND DATE(a.RESERVATIONDATE) BETWEEN b.CHECKINDATE AND b.CHECKOUTDATE
        WHERE
        DATE(a.RESERVATIONDATE) BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 1 DAY), INTERVAL 2 WEEK)
        GROUP BY
        a.ROOMTYPE, a.ROOMNUMBER, DATE(a.RESERVATIONDATE)
        ORDER BY
        a.ROOMTYPE, a.ROOMNUMBER, DATE(a.RESERVATIONDATE);
```

> 'INNER JOIN'을 사용하여 데이터 값으로 테이블를 생성하였더니 데이터가 존재하는 부분만 생성되어 'LEFT JOIN'으로 Mapper 수정

