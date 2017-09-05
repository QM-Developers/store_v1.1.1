package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class PushMessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PushMessageExample() {
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

        public Criteria andMsgIdIsNull() {
            addCriterion("msg_id is null");
            return (Criteria) this;
        }

        public Criteria andMsgIdIsNotNull() {
            addCriterion("msg_id is not null");
            return (Criteria) this;
        }

        public Criteria andMsgIdEqualTo(String value) {
            addCriterion("msg_id =", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdNotEqualTo(String value) {
            addCriterion("msg_id <>", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdGreaterThan(String value) {
            addCriterion("msg_id >", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdGreaterThanOrEqualTo(String value) {
            addCriterion("msg_id >=", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdLessThan(String value) {
            addCriterion("msg_id <", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdLessThanOrEqualTo(String value) {
            addCriterion("msg_id <=", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdLike(String value) {
            addCriterion("msg_id like", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdNotLike(String value) {
            addCriterion("msg_id not like", value, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdIn(List<String> values) {
            addCriterion("msg_id in", values, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdNotIn(List<String> values) {
            addCriterion("msg_id not in", values, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdBetween(String value1, String value2) {
            addCriterion("msg_id between", value1, value2, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgIdNotBetween(String value1, String value2) {
            addCriterion("msg_id not between", value1, value2, "msgId");
            return (Criteria) this;
        }

        public Criteria andMsgTitleIsNull() {
            addCriterion("msg_title is null");
            return (Criteria) this;
        }

        public Criteria andMsgTitleIsNotNull() {
            addCriterion("msg_title is not null");
            return (Criteria) this;
        }

        public Criteria andMsgTitleEqualTo(String value) {
            addCriterion("msg_title =", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleNotEqualTo(String value) {
            addCriterion("msg_title <>", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleGreaterThan(String value) {
            addCriterion("msg_title >", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleGreaterThanOrEqualTo(String value) {
            addCriterion("msg_title >=", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleLessThan(String value) {
            addCriterion("msg_title <", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleLessThanOrEqualTo(String value) {
            addCriterion("msg_title <=", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleLike(String value) {
            addCriterion("msg_title like", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleNotLike(String value) {
            addCriterion("msg_title not like", value, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleIn(List<String> values) {
            addCriterion("msg_title in", values, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleNotIn(List<String> values) {
            addCriterion("msg_title not in", values, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleBetween(String value1, String value2) {
            addCriterion("msg_title between", value1, value2, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTitleNotBetween(String value1, String value2) {
            addCriterion("msg_title not between", value1, value2, "msgTitle");
            return (Criteria) this;
        }

        public Criteria andMsgTextIsNull() {
            addCriterion("msg_text is null");
            return (Criteria) this;
        }

        public Criteria andMsgTextIsNotNull() {
            addCriterion("msg_text is not null");
            return (Criteria) this;
        }

        public Criteria andMsgTextEqualTo(String value) {
            addCriterion("msg_text =", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextNotEqualTo(String value) {
            addCriterion("msg_text <>", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextGreaterThan(String value) {
            addCriterion("msg_text >", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextGreaterThanOrEqualTo(String value) {
            addCriterion("msg_text >=", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextLessThan(String value) {
            addCriterion("msg_text <", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextLessThanOrEqualTo(String value) {
            addCriterion("msg_text <=", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextLike(String value) {
            addCriterion("msg_text like", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextNotLike(String value) {
            addCriterion("msg_text not like", value, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextIn(List<String> values) {
            addCriterion("msg_text in", values, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextNotIn(List<String> values) {
            addCriterion("msg_text not in", values, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextBetween(String value1, String value2) {
            addCriterion("msg_text between", value1, value2, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTextNotBetween(String value1, String value2) {
            addCriterion("msg_text not between", value1, value2, "msgText");
            return (Criteria) this;
        }

        public Criteria andMsgTickerIsNull() {
            addCriterion("msg_ticker is null");
            return (Criteria) this;
        }

        public Criteria andMsgTickerIsNotNull() {
            addCriterion("msg_ticker is not null");
            return (Criteria) this;
        }

        public Criteria andMsgTickerEqualTo(String value) {
            addCriterion("msg_ticker =", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerNotEqualTo(String value) {
            addCriterion("msg_ticker <>", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerGreaterThan(String value) {
            addCriterion("msg_ticker >", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerGreaterThanOrEqualTo(String value) {
            addCriterion("msg_ticker >=", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerLessThan(String value) {
            addCriterion("msg_ticker <", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerLessThanOrEqualTo(String value) {
            addCriterion("msg_ticker <=", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerLike(String value) {
            addCriterion("msg_ticker like", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerNotLike(String value) {
            addCriterion("msg_ticker not like", value, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerIn(List<String> values) {
            addCriterion("msg_ticker in", values, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerNotIn(List<String> values) {
            addCriterion("msg_ticker not in", values, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerBetween(String value1, String value2) {
            addCriterion("msg_ticker between", value1, value2, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTickerNotBetween(String value1, String value2) {
            addCriterion("msg_ticker not between", value1, value2, "msgTicker");
            return (Criteria) this;
        }

        public Criteria andMsgTypeIsNull() {
            addCriterion("msg_type is null");
            return (Criteria) this;
        }

        public Criteria andMsgTypeIsNotNull() {
            addCriterion("msg_type is not null");
            return (Criteria) this;
        }

        public Criteria andMsgTypeEqualTo(Byte value) {
            addCriterion("msg_type =", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeNotEqualTo(Byte value) {
            addCriterion("msg_type <>", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeGreaterThan(Byte value) {
            addCriterion("msg_type >", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("msg_type >=", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeLessThan(Byte value) {
            addCriterion("msg_type <", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeLessThanOrEqualTo(Byte value) {
            addCriterion("msg_type <=", value, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeIn(List<Byte> values) {
            addCriterion("msg_type in", values, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeNotIn(List<Byte> values) {
            addCriterion("msg_type not in", values, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeBetween(Byte value1, Byte value2) {
            addCriterion("msg_type between", value1, value2, "msgType");
            return (Criteria) this;
        }

        public Criteria andMsgTypeNotBetween(Byte value1, Byte value2) {
            addCriterion("msg_type not between", value1, value2, "msgType");
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