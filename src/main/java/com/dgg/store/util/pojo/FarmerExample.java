package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class FarmerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public FarmerExample() {
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

        public Criteria andFarmerIdIsNull() {
            addCriterion("farmer_id is null");
            return (Criteria) this;
        }

        public Criteria andFarmerIdIsNotNull() {
            addCriterion("farmer_id is not null");
            return (Criteria) this;
        }

        public Criteria andFarmerIdEqualTo(String value) {
            addCriterion("farmer_id =", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdNotEqualTo(String value) {
            addCriterion("farmer_id <>", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdGreaterThan(String value) {
            addCriterion("farmer_id >", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdGreaterThanOrEqualTo(String value) {
            addCriterion("farmer_id >=", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdLessThan(String value) {
            addCriterion("farmer_id <", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdLessThanOrEqualTo(String value) {
            addCriterion("farmer_id <=", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdLike(String value) {
            addCriterion("farmer_id like", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdNotLike(String value) {
            addCriterion("farmer_id not like", value, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdIn(List<String> values) {
            addCriterion("farmer_id in", values, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdNotIn(List<String> values) {
            addCriterion("farmer_id not in", values, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdBetween(String value1, String value2) {
            addCriterion("farmer_id between", value1, value2, "farmerId");
            return (Criteria) this;
        }

        public Criteria andFarmerIdNotBetween(String value1, String value2) {
            addCriterion("farmer_id not between", value1, value2, "farmerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdIsNull() {
            addCriterion("customer_id is null");
            return (Criteria) this;
        }

        public Criteria andCustomerIdIsNotNull() {
            addCriterion("customer_id is not null");
            return (Criteria) this;
        }

        public Criteria andCustomerIdEqualTo(String value) {
            addCriterion("customer_id =", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdNotEqualTo(String value) {
            addCriterion("customer_id <>", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdGreaterThan(String value) {
            addCriterion("customer_id >", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdGreaterThanOrEqualTo(String value) {
            addCriterion("customer_id >=", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdLessThan(String value) {
            addCriterion("customer_id <", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdLessThanOrEqualTo(String value) {
            addCriterion("customer_id <=", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdLike(String value) {
            addCriterion("customer_id like", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdNotLike(String value) {
            addCriterion("customer_id not like", value, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdIn(List<String> values) {
            addCriterion("customer_id in", values, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdNotIn(List<String> values) {
            addCriterion("customer_id not in", values, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdBetween(String value1, String value2) {
            addCriterion("customer_id between", value1, value2, "customerId");
            return (Criteria) this;
        }

        public Criteria andCustomerIdNotBetween(String value1, String value2) {
            addCriterion("customer_id not between", value1, value2, "customerId");
            return (Criteria) this;
        }

        public Criteria andFarmerNameIsNull() {
            addCriterion("farmer_name is null");
            return (Criteria) this;
        }

        public Criteria andFarmerNameIsNotNull() {
            addCriterion("farmer_name is not null");
            return (Criteria) this;
        }

        public Criteria andFarmerNameEqualTo(String value) {
            addCriterion("farmer_name =", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameNotEqualTo(String value) {
            addCriterion("farmer_name <>", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameGreaterThan(String value) {
            addCriterion("farmer_name >", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameGreaterThanOrEqualTo(String value) {
            addCriterion("farmer_name >=", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameLessThan(String value) {
            addCriterion("farmer_name <", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameLessThanOrEqualTo(String value) {
            addCriterion("farmer_name <=", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameLike(String value) {
            addCriterion("farmer_name like", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameNotLike(String value) {
            addCriterion("farmer_name not like", value, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameIn(List<String> values) {
            addCriterion("farmer_name in", values, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameNotIn(List<String> values) {
            addCriterion("farmer_name not in", values, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameBetween(String value1, String value2) {
            addCriterion("farmer_name between", value1, value2, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerNameNotBetween(String value1, String value2) {
            addCriterion("farmer_name not between", value1, value2, "farmerName");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneIsNull() {
            addCriterion("farmer_phone is null");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneIsNotNull() {
            addCriterion("farmer_phone is not null");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneEqualTo(String value) {
            addCriterion("farmer_phone =", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneNotEqualTo(String value) {
            addCriterion("farmer_phone <>", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneGreaterThan(String value) {
            addCriterion("farmer_phone >", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("farmer_phone >=", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneLessThan(String value) {
            addCriterion("farmer_phone <", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneLessThanOrEqualTo(String value) {
            addCriterion("farmer_phone <=", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneLike(String value) {
            addCriterion("farmer_phone like", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneNotLike(String value) {
            addCriterion("farmer_phone not like", value, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneIn(List<String> values) {
            addCriterion("farmer_phone in", values, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneNotIn(List<String> values) {
            addCriterion("farmer_phone not in", values, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneBetween(String value1, String value2) {
            addCriterion("farmer_phone between", value1, value2, "farmerPhone");
            return (Criteria) this;
        }

        public Criteria andFarmerPhoneNotBetween(String value1, String value2) {
            addCriterion("farmer_phone not between", value1, value2, "farmerPhone");
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