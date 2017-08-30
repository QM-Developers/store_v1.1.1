package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class CommonApplyApproveExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommonApplyApproveExample() {
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

        public Criteria andApplyIdIsNull() {
            addCriterion("apply_id is null");
            return (Criteria) this;
        }

        public Criteria andApplyIdIsNotNull() {
            addCriterion("apply_id is not null");
            return (Criteria) this;
        }

        public Criteria andApplyIdEqualTo(String value) {
            addCriterion("apply_id =", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotEqualTo(String value) {
            addCriterion("apply_id <>", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdGreaterThan(String value) {
            addCriterion("apply_id >", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdGreaterThanOrEqualTo(String value) {
            addCriterion("apply_id >=", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLessThan(String value) {
            addCriterion("apply_id <", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLessThanOrEqualTo(String value) {
            addCriterion("apply_id <=", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLike(String value) {
            addCriterion("apply_id like", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotLike(String value) {
            addCriterion("apply_id not like", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdIn(List<String> values) {
            addCriterion("apply_id in", values, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotIn(List<String> values) {
            addCriterion("apply_id not in", values, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdBetween(String value1, String value2) {
            addCriterion("apply_id between", value1, value2, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotBetween(String value1, String value2) {
            addCriterion("apply_id not between", value1, value2, "applyId");
            return (Criteria) this;
        }

        public Criteria andApproveIdIsNull() {
            addCriterion("approve_id is null");
            return (Criteria) this;
        }

        public Criteria andApproveIdIsNotNull() {
            addCriterion("approve_id is not null");
            return (Criteria) this;
        }

        public Criteria andApproveIdEqualTo(String value) {
            addCriterion("approve_id =", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdNotEqualTo(String value) {
            addCriterion("approve_id <>", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdGreaterThan(String value) {
            addCriterion("approve_id >", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdGreaterThanOrEqualTo(String value) {
            addCriterion("approve_id >=", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdLessThan(String value) {
            addCriterion("approve_id <", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdLessThanOrEqualTo(String value) {
            addCriterion("approve_id <=", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdLike(String value) {
            addCriterion("approve_id like", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdNotLike(String value) {
            addCriterion("approve_id not like", value, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdIn(List<String> values) {
            addCriterion("approve_id in", values, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdNotIn(List<String> values) {
            addCriterion("approve_id not in", values, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdBetween(String value1, String value2) {
            addCriterion("approve_id between", value1, value2, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveIdNotBetween(String value1, String value2) {
            addCriterion("approve_id not between", value1, value2, "approveId");
            return (Criteria) this;
        }

        public Criteria andApproveNameIsNull() {
            addCriterion("approve_name is null");
            return (Criteria) this;
        }

        public Criteria andApproveNameIsNotNull() {
            addCriterion("approve_name is not null");
            return (Criteria) this;
        }

        public Criteria andApproveNameEqualTo(String value) {
            addCriterion("approve_name =", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameNotEqualTo(String value) {
            addCriterion("approve_name <>", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameGreaterThan(String value) {
            addCriterion("approve_name >", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameGreaterThanOrEqualTo(String value) {
            addCriterion("approve_name >=", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameLessThan(String value) {
            addCriterion("approve_name <", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameLessThanOrEqualTo(String value) {
            addCriterion("approve_name <=", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameLike(String value) {
            addCriterion("approve_name like", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameNotLike(String value) {
            addCriterion("approve_name not like", value, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameIn(List<String> values) {
            addCriterion("approve_name in", values, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameNotIn(List<String> values) {
            addCriterion("approve_name not in", values, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameBetween(String value1, String value2) {
            addCriterion("approve_name between", value1, value2, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveNameNotBetween(String value1, String value2) {
            addCriterion("approve_name not between", value1, value2, "approveName");
            return (Criteria) this;
        }

        public Criteria andApproveResultIsNull() {
            addCriterion("approve_result is null");
            return (Criteria) this;
        }

        public Criteria andApproveResultIsNotNull() {
            addCriterion("approve_result is not null");
            return (Criteria) this;
        }

        public Criteria andApproveResultEqualTo(Byte value) {
            addCriterion("approve_result =", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultNotEqualTo(Byte value) {
            addCriterion("approve_result <>", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultGreaterThan(Byte value) {
            addCriterion("approve_result >", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultGreaterThanOrEqualTo(Byte value) {
            addCriterion("approve_result >=", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultLessThan(Byte value) {
            addCriterion("approve_result <", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultLessThanOrEqualTo(Byte value) {
            addCriterion("approve_result <=", value, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultIn(List<Byte> values) {
            addCriterion("approve_result in", values, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultNotIn(List<Byte> values) {
            addCriterion("approve_result not in", values, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultBetween(Byte value1, Byte value2) {
            addCriterion("approve_result between", value1, value2, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveResultNotBetween(Byte value1, Byte value2) {
            addCriterion("approve_result not between", value1, value2, "approveResult");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceIsNull() {
            addCriterion("approve_sequence is null");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceIsNotNull() {
            addCriterion("approve_sequence is not null");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceEqualTo(Byte value) {
            addCriterion("approve_sequence =", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceNotEqualTo(Byte value) {
            addCriterion("approve_sequence <>", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceGreaterThan(Byte value) {
            addCriterion("approve_sequence >", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceGreaterThanOrEqualTo(Byte value) {
            addCriterion("approve_sequence >=", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceLessThan(Byte value) {
            addCriterion("approve_sequence <", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceLessThanOrEqualTo(Byte value) {
            addCriterion("approve_sequence <=", value, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceIn(List<Byte> values) {
            addCriterion("approve_sequence in", values, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceNotIn(List<Byte> values) {
            addCriterion("approve_sequence not in", values, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceBetween(Byte value1, Byte value2) {
            addCriterion("approve_sequence between", value1, value2, "approveSequence");
            return (Criteria) this;
        }

        public Criteria andApproveSequenceNotBetween(Byte value1, Byte value2) {
            addCriterion("approve_sequence not between", value1, value2, "approveSequence");
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