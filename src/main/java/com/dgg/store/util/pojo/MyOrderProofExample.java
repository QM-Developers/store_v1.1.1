package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class MyOrderProofExample {
    private Integer pageNum;

    private Integer pageSize;

    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MyOrderProofExample() {
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

        public Criteria andProofIdIsNull() {
            addCriterion("proof_id is null");
            return (Criteria) this;
        }

        public Criteria andProofIdIsNotNull() {
            addCriterion("proof_id is not null");
            return (Criteria) this;
        }

        public Criteria andProofIdEqualTo(String value) {
            addCriterion("proof_id =", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdNotEqualTo(String value) {
            addCriterion("proof_id <>", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdGreaterThan(String value) {
            addCriterion("proof_id >", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdGreaterThanOrEqualTo(String value) {
            addCriterion("proof_id >=", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdLessThan(String value) {
            addCriterion("proof_id <", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdLessThanOrEqualTo(String value) {
            addCriterion("proof_id <=", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdLike(String value) {
            addCriterion("proof_id like", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdNotLike(String value) {
            addCriterion("proof_id not like", value, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdIn(List<String> values) {
            addCriterion("proof_id in", values, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdNotIn(List<String> values) {
            addCriterion("proof_id not in", values, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdBetween(String value1, String value2) {
            addCriterion("proof_id between", value1, value2, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofIdNotBetween(String value1, String value2) {
            addCriterion("proof_id not between", value1, value2, "proofId");
            return (Criteria) this;
        }

        public Criteria andProofUrlIsNull() {
            addCriterion("proof_url is null");
            return (Criteria) this;
        }

        public Criteria andProofUrlIsNotNull() {
            addCriterion("proof_url is not null");
            return (Criteria) this;
        }

        public Criteria andProofUrlEqualTo(String value) {
            addCriterion("proof_url =", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlNotEqualTo(String value) {
            addCriterion("proof_url <>", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlGreaterThan(String value) {
            addCriterion("proof_url >", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlGreaterThanOrEqualTo(String value) {
            addCriterion("proof_url >=", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlLessThan(String value) {
            addCriterion("proof_url <", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlLessThanOrEqualTo(String value) {
            addCriterion("proof_url <=", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlLike(String value) {
            addCriterion("proof_url like", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlNotLike(String value) {
            addCriterion("proof_url not like", value, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlIn(List<String> values) {
            addCriterion("proof_url in", values, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlNotIn(List<String> values) {
            addCriterion("proof_url not in", values, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlBetween(String value1, String value2) {
            addCriterion("proof_url between", value1, value2, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andProofUrlNotBetween(String value1, String value2) {
            addCriterion("proof_url not between", value1, value2, "proofUrl");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNull() {
            addCriterion("order_id is null");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNotNull() {
            addCriterion("order_id is not null");
            return (Criteria) this;
        }

        public Criteria andOrderIdEqualTo(String value) {
            addCriterion("order_id =", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotEqualTo(String value) {
            addCriterion("order_id <>", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThan(String value) {
            addCriterion("order_id >", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThanOrEqualTo(String value) {
            addCriterion("order_id >=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThan(String value) {
            addCriterion("order_id <", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThanOrEqualTo(String value) {
            addCriterion("order_id <=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLike(String value) {
            addCriterion("order_id like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotLike(String value) {
            addCriterion("order_id not like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdIn(List<String> values) {
            addCriterion("order_id in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotIn(List<String> values) {
            addCriterion("order_id not in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdBetween(String value1, String value2) {
            addCriterion("order_id between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotBetween(String value1, String value2) {
            addCriterion("order_id not between", value1, value2, "orderId");
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

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }
}