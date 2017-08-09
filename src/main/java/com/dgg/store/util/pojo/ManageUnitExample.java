package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class ManageUnitExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ManageUnitExample() {
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

        public Criteria andManageIdIsNull() {
            addCriterion("manage_id is null");
            return (Criteria) this;
        }

        public Criteria andManageIdIsNotNull() {
            addCriterion("manage_id is not null");
            return (Criteria) this;
        }

        public Criteria andManageIdEqualTo(String value) {
            addCriterion("manage_id =", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdNotEqualTo(String value) {
            addCriterion("manage_id <>", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdGreaterThan(String value) {
            addCriterion("manage_id >", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdGreaterThanOrEqualTo(String value) {
            addCriterion("manage_id >=", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdLessThan(String value) {
            addCriterion("manage_id <", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdLessThanOrEqualTo(String value) {
            addCriterion("manage_id <=", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdLike(String value) {
            addCriterion("manage_id like", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdNotLike(String value) {
            addCriterion("manage_id not like", value, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdIn(List<String> values) {
            addCriterion("manage_id in", values, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdNotIn(List<String> values) {
            addCriterion("manage_id not in", values, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdBetween(String value1, String value2) {
            addCriterion("manage_id between", value1, value2, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageIdNotBetween(String value1, String value2) {
            addCriterion("manage_id not between", value1, value2, "manageId");
            return (Criteria) this;
        }

        public Criteria andManageNameIsNull() {
            addCriterion("manage_name is null");
            return (Criteria) this;
        }

        public Criteria andManageNameIsNotNull() {
            addCriterion("manage_name is not null");
            return (Criteria) this;
        }

        public Criteria andManageNameEqualTo(String value) {
            addCriterion("manage_name =", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameNotEqualTo(String value) {
            addCriterion("manage_name <>", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameGreaterThan(String value) {
            addCriterion("manage_name >", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameGreaterThanOrEqualTo(String value) {
            addCriterion("manage_name >=", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameLessThan(String value) {
            addCriterion("manage_name <", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameLessThanOrEqualTo(String value) {
            addCriterion("manage_name <=", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameLike(String value) {
            addCriterion("manage_name like", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameNotLike(String value) {
            addCriterion("manage_name not like", value, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameIn(List<String> values) {
            addCriterion("manage_name in", values, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameNotIn(List<String> values) {
            addCriterion("manage_name not in", values, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameBetween(String value1, String value2) {
            addCriterion("manage_name between", value1, value2, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageNameNotBetween(String value1, String value2) {
            addCriterion("manage_name not between", value1, value2, "manageName");
            return (Criteria) this;
        }

        public Criteria andManageAddressIsNull() {
            addCriterion("manage_address is null");
            return (Criteria) this;
        }

        public Criteria andManageAddressIsNotNull() {
            addCriterion("manage_address is not null");
            return (Criteria) this;
        }

        public Criteria andManageAddressEqualTo(String value) {
            addCriterion("manage_address =", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressNotEqualTo(String value) {
            addCriterion("manage_address <>", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressGreaterThan(String value) {
            addCriterion("manage_address >", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressGreaterThanOrEqualTo(String value) {
            addCriterion("manage_address >=", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressLessThan(String value) {
            addCriterion("manage_address <", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressLessThanOrEqualTo(String value) {
            addCriterion("manage_address <=", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressLike(String value) {
            addCriterion("manage_address like", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressNotLike(String value) {
            addCriterion("manage_address not like", value, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressIn(List<String> values) {
            addCriterion("manage_address in", values, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressNotIn(List<String> values) {
            addCriterion("manage_address not in", values, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressBetween(String value1, String value2) {
            addCriterion("manage_address between", value1, value2, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAddressNotBetween(String value1, String value2) {
            addCriterion("manage_address not between", value1, value2, "manageAddress");
            return (Criteria) this;
        }

        public Criteria andManageAcreageIsNull() {
            addCriterion("manage_acreage is null");
            return (Criteria) this;
        }

        public Criteria andManageAcreageIsNotNull() {
            addCriterion("manage_acreage is not null");
            return (Criteria) this;
        }

        public Criteria andManageAcreageEqualTo(Integer value) {
            addCriterion("manage_acreage =", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageNotEqualTo(Integer value) {
            addCriterion("manage_acreage <>", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageGreaterThan(Integer value) {
            addCriterion("manage_acreage >", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageGreaterThanOrEqualTo(Integer value) {
            addCriterion("manage_acreage >=", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageLessThan(Integer value) {
            addCriterion("manage_acreage <", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageLessThanOrEqualTo(Integer value) {
            addCriterion("manage_acreage <=", value, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageIn(List<Integer> values) {
            addCriterion("manage_acreage in", values, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageNotIn(List<Integer> values) {
            addCriterion("manage_acreage not in", values, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageBetween(Integer value1, Integer value2) {
            addCriterion("manage_acreage between", value1, value2, "manageAcreage");
            return (Criteria) this;
        }

        public Criteria andManageAcreageNotBetween(Integer value1, Integer value2) {
            addCriterion("manage_acreage not between", value1, value2, "manageAcreage");
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