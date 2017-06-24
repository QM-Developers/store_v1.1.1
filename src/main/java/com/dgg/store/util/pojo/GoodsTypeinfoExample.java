package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class GoodsTypeinfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsTypeinfoExample() {
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

        public Criteria andGoodsTypeIdIsNull() {
            addCriterion("goods_type_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdIsNotNull() {
            addCriterion("goods_type_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdEqualTo(String value) {
            addCriterion("goods_type_id =", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdNotEqualTo(String value) {
            addCriterion("goods_type_id <>", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdGreaterThan(String value) {
            addCriterion("goods_type_id >", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_id >=", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdLessThan(String value) {
            addCriterion("goods_type_id <", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdLessThanOrEqualTo(String value) {
            addCriterion("goods_type_id <=", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdLike(String value) {
            addCriterion("goods_type_id like", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdNotLike(String value) {
            addCriterion("goods_type_id not like", value, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdIn(List<String> values) {
            addCriterion("goods_type_id in", values, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdNotIn(List<String> values) {
            addCriterion("goods_type_id not in", values, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdBetween(String value1, String value2) {
            addCriterion("goods_type_id between", value1, value2, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeIdNotBetween(String value1, String value2) {
            addCriterion("goods_type_id not between", value1, value2, "goodsTypeId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameIsNull() {
            addCriterion("goods_type_name is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameIsNotNull() {
            addCriterion("goods_type_name is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameEqualTo(String value) {
            addCriterion("goods_type_name =", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameNotEqualTo(String value) {
            addCriterion("goods_type_name <>", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameGreaterThan(String value) {
            addCriterion("goods_type_name >", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_name >=", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameLessThan(String value) {
            addCriterion("goods_type_name <", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameLessThanOrEqualTo(String value) {
            addCriterion("goods_type_name <=", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameLike(String value) {
            addCriterion("goods_type_name like", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameNotLike(String value) {
            addCriterion("goods_type_name not like", value, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameIn(List<String> values) {
            addCriterion("goods_type_name in", values, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameNotIn(List<String> values) {
            addCriterion("goods_type_name not in", values, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameBetween(String value1, String value2) {
            addCriterion("goods_type_name between", value1, value2, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeNameNotBetween(String value1, String value2) {
            addCriterion("goods_type_name not between", value1, value2, "goodsTypeName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelIsNull() {
            addCriterion("goods_type_level is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelIsNotNull() {
            addCriterion("goods_type_level is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelEqualTo(Integer value) {
            addCriterion("goods_type_level =", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelNotEqualTo(Integer value) {
            addCriterion("goods_type_level <>", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelGreaterThan(Integer value) {
            addCriterion("goods_type_level >", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("goods_type_level >=", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelLessThan(Integer value) {
            addCriterion("goods_type_level <", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelLessThanOrEqualTo(Integer value) {
            addCriterion("goods_type_level <=", value, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelIn(List<Integer> values) {
            addCriterion("goods_type_level in", values, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelNotIn(List<Integer> values) {
            addCriterion("goods_type_level not in", values, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelBetween(Integer value1, Integer value2) {
            addCriterion("goods_type_level between", value1, value2, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("goods_type_level not between", value1, value2, "goodsTypeLevel");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidIsNull() {
            addCriterion("goods_type_pid is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidIsNotNull() {
            addCriterion("goods_type_pid is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidEqualTo(String value) {
            addCriterion("goods_type_pid =", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidNotEqualTo(String value) {
            addCriterion("goods_type_pid <>", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidGreaterThan(String value) {
            addCriterion("goods_type_pid >", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_pid >=", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidLessThan(String value) {
            addCriterion("goods_type_pid <", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidLessThanOrEqualTo(String value) {
            addCriterion("goods_type_pid <=", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidLike(String value) {
            addCriterion("goods_type_pid like", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidNotLike(String value) {
            addCriterion("goods_type_pid not like", value, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidIn(List<String> values) {
            addCriterion("goods_type_pid in", values, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidNotIn(List<String> values) {
            addCriterion("goods_type_pid not in", values, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidBetween(String value1, String value2) {
            addCriterion("goods_type_pid between", value1, value2, "goodsTypePid");
            return (Criteria) this;
        }

        public Criteria andGoodsTypePidNotBetween(String value1, String value2) {
            addCriterion("goods_type_pid not between", value1, value2, "goodsTypePid");
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