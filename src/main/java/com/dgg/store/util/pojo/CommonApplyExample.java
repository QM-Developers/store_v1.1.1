package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class CommonApplyExample {
    private int pageNum;

    private int pageSize;

    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommonApplyExample() {
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

        public Criteria andApplyTitleIsNull() {
            addCriterion("apply_title is null");
            return (Criteria) this;
        }

        public Criteria andApplyTitleIsNotNull() {
            addCriterion("apply_title is not null");
            return (Criteria) this;
        }

        public Criteria andApplyTitleEqualTo(String value) {
            addCriterion("apply_title =", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleNotEqualTo(String value) {
            addCriterion("apply_title <>", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleGreaterThan(String value) {
            addCriterion("apply_title >", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleGreaterThanOrEqualTo(String value) {
            addCriterion("apply_title >=", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleLessThan(String value) {
            addCriterion("apply_title <", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleLessThanOrEqualTo(String value) {
            addCriterion("apply_title <=", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleLike(String value) {
            addCriterion("apply_title like", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleNotLike(String value) {
            addCriterion("apply_title not like", value, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleIn(List<String> values) {
            addCriterion("apply_title in", values, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleNotIn(List<String> values) {
            addCriterion("apply_title not in", values, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleBetween(String value1, String value2) {
            addCriterion("apply_title between", value1, value2, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andApplyTitleNotBetween(String value1, String value2) {
            addCriterion("apply_title not between", value1, value2, "applyTitle");
            return (Criteria) this;
        }

        public Criteria andProposerIdIsNull() {
            addCriterion("proposer_id is null");
            return (Criteria) this;
        }

        public Criteria andProposerIdIsNotNull() {
            addCriterion("proposer_id is not null");
            return (Criteria) this;
        }

        public Criteria andProposerIdEqualTo(String value) {
            addCriterion("proposer_id =", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotEqualTo(String value) {
            addCriterion("proposer_id <>", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdGreaterThan(String value) {
            addCriterion("proposer_id >", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdGreaterThanOrEqualTo(String value) {
            addCriterion("proposer_id >=", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLessThan(String value) {
            addCriterion("proposer_id <", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLessThanOrEqualTo(String value) {
            addCriterion("proposer_id <=", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLike(String value) {
            addCriterion("proposer_id like", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotLike(String value) {
            addCriterion("proposer_id not like", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdIn(List<String> values) {
            addCriterion("proposer_id in", values, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotIn(List<String> values) {
            addCriterion("proposer_id not in", values, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdBetween(String value1, String value2) {
            addCriterion("proposer_id between", value1, value2, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotBetween(String value1, String value2) {
            addCriterion("proposer_id not between", value1, value2, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerNameIsNull() {
            addCriterion("proposer_name is null");
            return (Criteria) this;
        }

        public Criteria andProposerNameIsNotNull() {
            addCriterion("proposer_name is not null");
            return (Criteria) this;
        }

        public Criteria andProposerNameEqualTo(String value) {
            addCriterion("proposer_name =", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotEqualTo(String value) {
            addCriterion("proposer_name <>", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameGreaterThan(String value) {
            addCriterion("proposer_name >", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameGreaterThanOrEqualTo(String value) {
            addCriterion("proposer_name >=", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLessThan(String value) {
            addCriterion("proposer_name <", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLessThanOrEqualTo(String value) {
            addCriterion("proposer_name <=", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLike(String value) {
            addCriterion("proposer_name like", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotLike(String value) {
            addCriterion("proposer_name not like", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameIn(List<String> values) {
            addCriterion("proposer_name in", values, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotIn(List<String> values) {
            addCriterion("proposer_name not in", values, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameBetween(String value1, String value2) {
            addCriterion("proposer_name between", value1, value2, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotBetween(String value1, String value2) {
            addCriterion("proposer_name not between", value1, value2, "proposerName");
            return (Criteria) this;
        }

        public Criteria andBeginDateIsNull() {
            addCriterion("begin_date is null");
            return (Criteria) this;
        }

        public Criteria andBeginDateIsNotNull() {
            addCriterion("begin_date is not null");
            return (Criteria) this;
        }

        public Criteria andBeginDateEqualTo(Date value) {
            addCriterionForJDBCDate("begin_date =", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("begin_date <>", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateGreaterThan(Date value) {
            addCriterionForJDBCDate("begin_date >", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("begin_date >=", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateLessThan(Date value) {
            addCriterionForJDBCDate("begin_date <", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("begin_date <=", value, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateIn(List<Date> values) {
            addCriterionForJDBCDate("begin_date in", values, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("begin_date not in", values, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("begin_date between", value1, value2, "beginDate");
            return (Criteria) this;
        }

        public Criteria andBeginDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("begin_date not between", value1, value2, "beginDate");
            return (Criteria) this;
        }

        public Criteria andEndDateIsNull() {
            addCriterion("end_date is null");
            return (Criteria) this;
        }

        public Criteria andEndDateIsNotNull() {
            addCriterion("end_date is not null");
            return (Criteria) this;
        }

        public Criteria andEndDateEqualTo(Date value) {
            addCriterionForJDBCDate("end_date =", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("end_date <>", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateGreaterThan(Date value) {
            addCriterionForJDBCDate("end_date >", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("end_date >=", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateLessThan(Date value) {
            addCriterionForJDBCDate("end_date <", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("end_date <=", value, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateIn(List<Date> values) {
            addCriterionForJDBCDate("end_date in", values, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("end_date not in", values, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("end_date between", value1, value2, "endDate");
            return (Criteria) this;
        }

        public Criteria andEndDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("end_date not between", value1, value2, "endDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andApplyResultIsNull() {
            addCriterion("apply_result is null");
            return (Criteria) this;
        }

        public Criteria andApplyResultIsNotNull() {
            addCriterion("apply_result is not null");
            return (Criteria) this;
        }

        public Criteria andApplyResultEqualTo(Byte value) {
            addCriterion("apply_result =", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultNotEqualTo(Byte value) {
            addCriterion("apply_result <>", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultGreaterThan(Byte value) {
            addCriterion("apply_result >", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultGreaterThanOrEqualTo(Byte value) {
            addCriterion("apply_result >=", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultLessThan(Byte value) {
            addCriterion("apply_result <", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultLessThanOrEqualTo(Byte value) {
            addCriterion("apply_result <=", value, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultIn(List<Byte> values) {
            addCriterion("apply_result in", values, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultNotIn(List<Byte> values) {
            addCriterion("apply_result not in", values, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultBetween(Byte value1, Byte value2) {
            addCriterion("apply_result between", value1, value2, "applyResult");
            return (Criteria) this;
        }

        public Criteria andApplyResultNotBetween(Byte value1, Byte value2) {
            addCriterion("apply_result not between", value1, value2, "applyResult");
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

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }
}