package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class GoodsTypeAttrExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsTypeAttrExample() {
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

        public Criteria andGoodsTypeAttrIdIsNull() {
            addCriterion("goods_type_attr_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdIsNotNull() {
            addCriterion("goods_type_attr_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdEqualTo(String value) {
            addCriterion("goods_type_attr_id =", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdNotEqualTo(String value) {
            addCriterion("goods_type_attr_id <>", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdGreaterThan(String value) {
            addCriterion("goods_type_attr_id >", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_id >=", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdLessThan(String value) {
            addCriterion("goods_type_attr_id <", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdLessThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_id <=", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdLike(String value) {
            addCriterion("goods_type_attr_id like", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdNotLike(String value) {
            addCriterion("goods_type_attr_id not like", value, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdIn(List<String> values) {
            addCriterion("goods_type_attr_id in", values, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdNotIn(List<String> values) {
            addCriterion("goods_type_attr_id not in", values, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdBetween(String value1, String value2) {
            addCriterion("goods_type_attr_id between", value1, value2, "goodsTypeAttrId");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrIdNotBetween(String value1, String value2) {
            addCriterion("goods_type_attr_id not between", value1, value2, "goodsTypeAttrId");
            return (Criteria) this;
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

        public Criteria andGoodsTypeAttrNameIsNull() {
            addCriterion("goods_type_attr_name is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameIsNotNull() {
            addCriterion("goods_type_attr_name is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameEqualTo(String value) {
            addCriterion("goods_type_attr_name =", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameNotEqualTo(String value) {
            addCriterion("goods_type_attr_name <>", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameGreaterThan(String value) {
            addCriterion("goods_type_attr_name >", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_name >=", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameLessThan(String value) {
            addCriterion("goods_type_attr_name <", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameLessThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_name <=", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameLike(String value) {
            addCriterion("goods_type_attr_name like", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameNotLike(String value) {
            addCriterion("goods_type_attr_name not like", value, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameIn(List<String> values) {
            addCriterion("goods_type_attr_name in", values, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameNotIn(List<String> values) {
            addCriterion("goods_type_attr_name not in", values, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameBetween(String value1, String value2) {
            addCriterion("goods_type_attr_name between", value1, value2, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrNameNotBetween(String value1, String value2) {
            addCriterion("goods_type_attr_name not between", value1, value2, "goodsTypeAttrName");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueIsNull() {
            addCriterion("goods_type_attr_value is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueIsNotNull() {
            addCriterion("goods_type_attr_value is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueEqualTo(String value) {
            addCriterion("goods_type_attr_value =", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueNotEqualTo(String value) {
            addCriterion("goods_type_attr_value <>", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueGreaterThan(String value) {
            addCriterion("goods_type_attr_value >", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_value >=", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueLessThan(String value) {
            addCriterion("goods_type_attr_value <", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueLessThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_value <=", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueLike(String value) {
            addCriterion("goods_type_attr_value like", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueNotLike(String value) {
            addCriterion("goods_type_attr_value not like", value, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueIn(List<String> values) {
            addCriterion("goods_type_attr_value in", values, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueNotIn(List<String> values) {
            addCriterion("goods_type_attr_value not in", values, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueBetween(String value1, String value2) {
            addCriterion("goods_type_attr_value between", value1, value2, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrValueNotBetween(String value1, String value2) {
            addCriterion("goods_type_attr_value not between", value1, value2, "goodsTypeAttrValue");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstIsNull() {
            addCriterion("goods_type_attr_const is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstIsNotNull() {
            addCriterion("goods_type_attr_const is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstEqualTo(String value) {
            addCriterion("goods_type_attr_const =", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstNotEqualTo(String value) {
            addCriterion("goods_type_attr_const <>", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstGreaterThan(String value) {
            addCriterion("goods_type_attr_const >", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_const >=", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstLessThan(String value) {
            addCriterion("goods_type_attr_const <", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstLessThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_const <=", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstLike(String value) {
            addCriterion("goods_type_attr_const like", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstNotLike(String value) {
            addCriterion("goods_type_attr_const not like", value, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstIn(List<String> values) {
            addCriterion("goods_type_attr_const in", values, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstNotIn(List<String> values) {
            addCriterion("goods_type_attr_const not in", values, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstBetween(String value1, String value2) {
            addCriterion("goods_type_attr_const between", value1, value2, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrConstNotBetween(String value1, String value2) {
            addCriterion("goods_type_attr_const not between", value1, value2, "goodsTypeAttrConst");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeIsNull() {
            addCriterion("goods_type_attr_input_type is null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeIsNotNull() {
            addCriterion("goods_type_attr_input_type is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeEqualTo(String value) {
            addCriterion("goods_type_attr_input_type =", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeNotEqualTo(String value) {
            addCriterion("goods_type_attr_input_type <>", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeGreaterThan(String value) {
            addCriterion("goods_type_attr_input_type >", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeGreaterThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_input_type >=", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeLessThan(String value) {
            addCriterion("goods_type_attr_input_type <", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeLessThanOrEqualTo(String value) {
            addCriterion("goods_type_attr_input_type <=", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeLike(String value) {
            addCriterion("goods_type_attr_input_type like", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeNotLike(String value) {
            addCriterion("goods_type_attr_input_type not like", value, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeIn(List<String> values) {
            addCriterion("goods_type_attr_input_type in", values, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeNotIn(List<String> values) {
            addCriterion("goods_type_attr_input_type not in", values, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeBetween(String value1, String value2) {
            addCriterion("goods_type_attr_input_type between", value1, value2, "goodsTypeAttrInputType");
            return (Criteria) this;
        }

        public Criteria andGoodsTypeAttrInputTypeNotBetween(String value1, String value2) {
            addCriterion("goods_type_attr_input_type not between", value1, value2, "goodsTypeAttrInputType");
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