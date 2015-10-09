/*==============================================================*/
/* DBMS name:      SQLite3 DB                                   */
/* Created on:     2015/9/19 10:26:33                           */
/*==============================================================*/

drop table if exists Foods;



/*==============================================================*/
/* Table: Foods                                                 */
/*==============================================================*/
create table Foods
(
FoodID              INTEGER   primary key autoincrement     not null,
FoodName            TEXT,
FoodIcon            TEXT,
FoodPrice           TEXT,
ShopPic             TEXT,
ShopBrand           TEXT,
BigCateringType     TEXT,
DetailCateringType  TEXT,
CateringWebLink     TEXT
);
/*==============================================================*/
/* 插入数据                                                      */
/*==============================================================*/
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('伴鸡伴虾堡沙拉套餐','伴鸡伴虾堡沙拉套餐_结果.gif','肯德基','¥39','肯德基ShopPic.png','快餐','汉堡',NULL);
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('劲脆鸡腿堡','劲脆鸡腿堡_结果.gif','肯德基','¥16.5','肯德基ShopPic.png','快餐','汉堡',NULL);
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('劲脆鸡腿堡套餐','劲脆鸡腿堡套餐_结果.gif','肯德基','¥36.5','肯德基ShopPic.png','快餐','汉堡',NULL);
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('培根烤鸡腿堡','培根烤鸡腿堡_结果.gif','肯德基','¥37.5','肯德基ShopPic.png','快餐','汉堡',NULL);
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('手撕猪肉堡沙拉套餐','手撕猪肉堡沙拉套餐_结果.gif','肯德基','¥38','肯德基ShopPic.png','快餐','汉堡',NULL);
insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,ShopPic,BigCateringType,DetailCateringType,CateringWebLink) values ('香辣鸡腿堡','香辣鸡腿堡_结果.gif','肯德基','¥17','肯德基ShopPic.png','快餐','汉堡',NULL);

