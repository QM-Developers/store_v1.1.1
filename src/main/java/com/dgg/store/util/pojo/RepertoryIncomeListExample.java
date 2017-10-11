package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class RepertoryIncomeListExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RepertoryIncomeListExample() {
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

        public Criteria andRecordIdIsNull() {
            addCriterion("record_id is null");
            return (Criteria) this;
        }

        public Criteria andRecordIdIsNotNull() {
            addCriterion("record_id is not null");
            return (Criteria) this;
        }

        public Criteria andRecordIdEqualTo(String value) {
            addCriterion("record_id =", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotEqualTo(String value) {
            addCriterion("record_id <>", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThan(String value) {
            addCriterion("record_id >", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThanOrEqualTo(String value) {
            addCriterion("record_id >=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThan(String value) {
            addCriterion("record_id <", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThanOrEqualTo(String value) {
            addCriterion("record_id <=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLike(String value) {
            addCriterion("record_id like", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotLike(String value) {
            addCriterion("record_id not like", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdIn(List<String> values) {
            addCriterion("record_id in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotIn(List<String> values) {
            addCriterion("record_id not in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdBetween(String value1, String value2) {
            addCriterion("record_id between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotBetween(String value1, String value2) {
            addCriterion("record_id not between", value1, value2, "recordId");
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

        public Criteria andGoodsNameIsNull() {
            addCriterion("goods_name is null");
            return (Criteria) this;
        }

        public Criteria andGoodsNameIsNotNull() {
            addCriterion("goods_name is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsNameEqualTo(String value) {
            addCriterion("goods_name =", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameNotEqualTo(String value) {
            addCriterion("goods_name <>", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameGreaterThan(String value) {
            addCriterion("goods_name >", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameGreaterThanOrEqualTo(String value) {
            addCriterion("goods_name >=", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameLessThan(String value) {
            addCriterion("goods_name <", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameLessThanOrEqualTo(String value) {
            addCriterion("goods_name <=", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameLike(String value) {
            addCriterion("goods_name like", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameNotLike(String value) {
            addCriterion("goods_name not like", value, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameIn(List<String> values) {
            addCriterion("goods_name in", values, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameNotIn(List<String> values) {
            addCriterion("goods_name not in", values, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameBetween(String value1, String value2) {
            addCriterion("goods_name between", value1, value2, "goodsName");
            return (Criteria) this;
        }

        public Criteria andGoodsNameNotBetween(String value1, String value2) {
            addCriterion("goods_name not between", value1, value2, "goodsName");
            return (Criteria) this;
        }

        public Criteria andStandardIdIsNull() {
            addCriterion("standard_id is null");
            return (Criteria) this;
        }

        public Criteria andStandardIdIsNotNull() {
            addCriterion("standard_id is not null");
            return (Criteria) this;
        }

        public Criteria andStandardIdEqualTo(String value) {
            addCriterion("standard_id =", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdNotEqualTo(String value) {
            addCriterion("standard_id <>", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdGreaterThan(String value) {
            addCriterion("standard_id >", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdGreaterThanOrEqualTo(String value) {
            addCriterion("standard_id >=", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdLessThan(String value) {
            addCriterion("standard_id <", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdLessThanOrEqualTo(String value) {
            addCriterion("standard_id <=", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdLike(String value) {
            addCriterion("standard_id like", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdNotLike(String value) {
            addCriterion("standard_id not like", value, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdIn(List<String> values) {
            addCriterion("standard_id in", values, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdNotIn(List<String> values) {
            addCriterion("standard_id not in", values, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdBetween(String value1, String value2) {
            addCriterion("standard_id between", value1, value2, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardIdNotBetween(String value1, String value2) {
            addCriterion("standard_id not between", value1, value2, "standardId");
            return (Criteria) this;
        }

        public Criteria andStandardNameIsNull() {
            addCriterion("standard_name is null");
            return (Criteria) this;
        }

        public Criteria andStandardNameIsNotNull() {
            addCriterion("standard_name is not null");
            return (Criteria) this;
        }

        public Criteria andStandardNameEqualTo(String value) {
            addCriterion("standard_name =", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameNotEqualTo(String value) {
            addCriterion("standard_name <>", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameGreaterThan(String value) {
            addCriterion("standard_name >", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameGreaterThanOrEqualTo(String value) {
            addCriterion("standard_name >=", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameLessThan(String value) {
            addCriterion("standard_name <", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameLessThanOrEqualTo(String value) {
            addCriterion("standard_name <=", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameLike(String value) {
            addCriterion("standard_name like", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameNotLike(String value) {
            addCriterion("standard_name not like", value, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameIn(List<String> values) {
            addCriterion("standard_name in", values, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameNotIn(List<String> values) {
            addCriterion("standard_name not in", values, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameBetween(String value1, String value2) {
            addCriterion("standard_name between", value1, value2, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardNameNotBetween(String value1, String value2) {
            addCriterion("standard_name not between", value1, value2, "standardName");
            return (Criteria) this;
        }

        public Criteria andStandardCountIsNull() {
            addCriterion("standard_count is null");
            return (Criteria) this;
        }

        public Criteria andStandardCountIsNotNull() {
            addCriterion("standard_count is not null");
            return (Criteria) this;
        }

        public Criteria andStandardCountEqualTo(Integer value) {
            addCriterion("standard_count =", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountNotEqualTo(Integer value) {
            addCriterion("standard_count <>", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountGreaterThan(Integer value) {
            addCriterion("standard_count >", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("standard_count >=", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountLessThan(Integer value) {
            addCriterion("standard_count <", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountLessThanOrEqualTo(Integer value) {
            addCriterion("standard_count <=", value, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountIn(List<Integer> values) {
            addCriterion("standard_count in", values, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountNotIn(List<Integer> values) {
            addCriterion("standard_count not in", values, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountBetween(Integer value1, Integer value2) {
            addCriterion("standard_count between", value1, value2, "standardCount");
            return (Criteria) this;
        }

        public Criteria andStandardCountNotBetween(Integer value1, Integer value2) {
            addCriterion("standard_count not between", value1, value2, "standardCount");
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