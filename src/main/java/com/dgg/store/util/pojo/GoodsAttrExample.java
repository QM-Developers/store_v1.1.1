package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class GoodsAttrExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsAttrExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andGoodsAttrIdIsNull() {
            addCriterion("goods_attr_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdIsNotNull() {
            addCriterion("goods_attr_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdEqualTo(String value) {
            addCriterion("goods_attr_id =", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdNotEqualTo(String value) {
            addCriterion("goods_attr_id <>", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdGreaterThan(String value) {
            addCriterion("goods_attr_id >", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdGreaterThanOrEqualTo(String value) {
            addCriterion("goods_attr_id >=", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdLessThan(String value) {
            addCriterion("goods_attr_id <", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdLessThanOrEqualTo(String value) {
            addCriterion("goods_attr_id <=", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdLike(String value) {
            addCriterion("goods_attr_id like", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdNotLike(String value) {
            addCriterion("goods_attr_id not like", value, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdIn(List<String> values) {
            addCriterion("goods_attr_id in", values, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdNotIn(List<String> values) {
            addCriterion("goods_attr_id not in", values, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdBetween(String value1, String value2) {
            addCriterion("goods_attr_id between", value1, value2, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrIdNotBetween(String value1, String value2) {
            addCriterion("goods_attr_id not between", value1, value2, "goodsAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdIsNull() {
            addCriterion("goods_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodsIdIsNotNull() {
            addCriterion("goods_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsIdEqualTo(String value) {
            addCriterion("goods_id =", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdNotEqualTo(String value) {
            addCriterion("goods_id <>", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdGreaterThan(String value) {
            addCriterion("goods_id >", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdGreaterThanOrEqualTo(String value) {
            addCriterion("goods_id >=", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdLessThan(String value) {
            addCriterion("goods_id <", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdLessThanOrEqualTo(String value) {
            addCriterion("goods_id <=", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdLike(String value) {
            addCriterion("goods_id like", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdNotLike(String value) {
            addCriterion("goods_id not like", value, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdIn(List<String> values) {
            addCriterion("goods_id in", values, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdNotIn(List<String> values) {
            addCriterion("goods_id not in", values, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdBetween(String value1, String value2) {
            addCriterion("goods_id between", value1, value2, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsIdNotBetween(String value1, String value2) {
            addCriterion("goods_id not between", value1, value2, "goodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameIsNull() {
            addCriterion("goods_attr_name is null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameIsNotNull() {
            addCriterion("goods_attr_name is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameEqualTo(String value) {
            addCriterion("goods_attr_name =", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameNotEqualTo(String value) {
            addCriterion("goods_attr_name <>", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameGreaterThan(String value) {
            addCriterion("goods_attr_name >", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameGreaterThanOrEqualTo(String value) {
            addCriterion("goods_attr_name >=", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameLessThan(String value) {
            addCriterion("goods_attr_name <", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameLessThanOrEqualTo(String value) {
            addCriterion("goods_attr_name <=", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameLike(String value) {
            addCriterion("goods_attr_name like", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameNotLike(String value) {
            addCriterion("goods_attr_name not like", value, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameIn(List<String> values) {
            addCriterion("goods_attr_name in", values, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameNotIn(List<String> values) {
            addCriterion("goods_attr_name not in", values, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameBetween(String value1, String value2) {
            addCriterion("goods_attr_name between", value1, value2, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrNameNotBetween(String value1, String value2) {
            addCriterion("goods_attr_name not between", value1, value2, "goodsAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeIsNull() {
            addCriterion("goods_attr_type is null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeIsNotNull() {
            addCriterion("goods_attr_type is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeEqualTo(String value) {
            addCriterion("goods_attr_type =", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeNotEqualTo(String value) {
            addCriterion("goods_attr_type <>", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeGreaterThan(String value) {
            addCriterion("goods_attr_type >", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeGreaterThanOrEqualTo(String value) {
            addCriterion("goods_attr_type >=", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeLessThan(String value) {
            addCriterion("goods_attr_type <", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeLessThanOrEqualTo(String value) {
            addCriterion("goods_attr_type <=", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeLike(String value) {
            addCriterion("goods_attr_type like", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeNotLike(String value) {
            addCriterion("goods_attr_type not like", value, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeIn(List<String> values) {
            addCriterion("goods_attr_type in", values, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeNotIn(List<String> values) {
            addCriterion("goods_attr_type not in", values, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeBetween(String value1, String value2) {
            addCriterion("goods_attr_type between", value1, value2, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andGoodsAttrTypeNotBetween(String value1, String value2) {
            addCriterion("goods_attr_type not between", value1, value2, "goodsAttrType");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIsNull() {
            addCriterion("is_deleted is null");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIsNotNull() {
            addCriterion("is_deleted is not null");
            return (Criteria) this;
        }

        public Criteria andIsDeletedEqualTo(Byte value) {
            addCriterion("is_deleted =", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotEqualTo(Byte value) {
            addCriterion("is_deleted <>", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedGreaterThan(Byte value) {
            addCriterion("is_deleted >", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedGreaterThanOrEqualTo(Byte value) {
            addCriterion("is_deleted >=", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedLessThan(Byte value) {
            addCriterion("is_deleted <", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedLessThanOrEqualTo(Byte value) {
            addCriterion("is_deleted <=", value, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedIn(List<Byte> values) {
            addCriterion("is_deleted in", values, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotIn(List<Byte> values) {
            addCriterion("is_deleted not in", values, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedBetween(Byte value1, Byte value2) {
            addCriterion("is_deleted between", value1, value2, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andIsDeletedNotBetween(Byte value1, Byte value2) {
            addCriterion("is_deleted not between", value1, value2, "isDeleted");
            return (Criteria) this;
        }

        public Criteria andDeleteDateIsNull() {
            addCriterion("delete_date is null");
            return (Criteria) this;
        }

        public Criteria andDeleteDateIsNotNull() {
            addCriterion("delete_date is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteDateEqualTo(Date value) {
            addCriterionForJDBCDate("delete_date =", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("delete_date <>", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateGreaterThan(Date value) {
            addCriterionForJDBCDate("delete_date >", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("delete_date >=", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateLessThan(Date value) {
            addCriterionForJDBCDate("delete_date <", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("delete_date <=", value, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateIn(List<Date> values) {
            addCriterionForJDBCDate("delete_date in", values, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("delete_date not in", values, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("delete_date between", value1, value2, "deleteDate");
            return (Criteria) this;
        }

        public Criteria andDeleteDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("delete_date not between", value1, value2, "deleteDate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}