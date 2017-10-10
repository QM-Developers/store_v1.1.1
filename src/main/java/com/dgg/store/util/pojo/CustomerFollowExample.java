package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerFollowExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;
    private int pageNum;
    private int pageSize;

    public CustomerFollowExample() {
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

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getPageSize()
    {
        return pageSize;
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

        public Criteria andFollowIdIsNull() {
            addCriterion("follow_id is null");
            return (Criteria) this;
        }

        public Criteria andFollowIdIsNotNull() {
            addCriterion("follow_id is not null");
            return (Criteria) this;
        }

        public Criteria andFollowIdEqualTo(String value) {
            addCriterion("follow_id =", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdNotEqualTo(String value) {
            addCriterion("follow_id <>", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdGreaterThan(String value) {
            addCriterion("follow_id >", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdGreaterThanOrEqualTo(String value) {
            addCriterion("follow_id >=", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdLessThan(String value) {
            addCriterion("follow_id <", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdLessThanOrEqualTo(String value) {
            addCriterion("follow_id <=", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdLike(String value) {
            addCriterion("follow_id like", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdNotLike(String value) {
            addCriterion("follow_id not like", value, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdIn(List<String> values) {
            addCriterion("follow_id in", values, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdNotIn(List<String> values) {
            addCriterion("follow_id not in", values, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdBetween(String value1, String value2) {
            addCriterion("follow_id between", value1, value2, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowIdNotBetween(String value1, String value2) {
            addCriterion("follow_id not between", value1, value2, "followId");
            return (Criteria) this;
        }

        public Criteria andFollowTitleIsNull() {
            addCriterion("follow_title is null");
            return (Criteria) this;
        }

        public Criteria andFollowTitleIsNotNull() {
            addCriterion("follow_title is not null");
            return (Criteria) this;
        }

        public Criteria andFollowTitleEqualTo(String value) {
            addCriterion("follow_title =", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleNotEqualTo(String value) {
            addCriterion("follow_title <>", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleGreaterThan(String value) {
            addCriterion("follow_title >", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleGreaterThanOrEqualTo(String value) {
            addCriterion("follow_title >=", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleLessThan(String value) {
            addCriterion("follow_title <", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleLessThanOrEqualTo(String value) {
            addCriterion("follow_title <=", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleLike(String value) {
            addCriterion("follow_title like", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleNotLike(String value) {
            addCriterion("follow_title not like", value, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleIn(List<String> values) {
            addCriterion("follow_title in", values, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleNotIn(List<String> values) {
            addCriterion("follow_title not in", values, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleBetween(String value1, String value2) {
            addCriterion("follow_title between", value1, value2, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowTitleNotBetween(String value1, String value2) {
            addCriterion("follow_title not between", value1, value2, "followTitle");
            return (Criteria) this;
        }

        public Criteria andFollowDateIsNull() {
            addCriterion("follow_date is null");
            return (Criteria) this;
        }

        public Criteria andFollowDateIsNotNull() {
            addCriterion("follow_date is not null");
            return (Criteria) this;
        }

        public Criteria andFollowDateEqualTo(Date value) {
            addCriterion("follow_date =", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateNotEqualTo(Date value) {
            addCriterion("follow_date <>", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateGreaterThan(Date value) {
            addCriterion("follow_date >", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateGreaterThanOrEqualTo(Date value) {
            addCriterion("follow_date >=", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateLessThan(Date value) {
            addCriterion("follow_date <", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateLessThanOrEqualTo(Date value) {
            addCriterion("follow_date <=", value, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateIn(List<Date> values) {
            addCriterion("follow_date in", values, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateNotIn(List<Date> values) {
            addCriterion("follow_date not in", values, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateBetween(Date value1, Date value2) {
            addCriterion("follow_date between", value1, value2, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowDateNotBetween(Date value1, Date value2) {
            addCriterion("follow_date not between", value1, value2, "followDate");
            return (Criteria) this;
        }

        public Criteria andFollowContentIsNull() {
            addCriterion("follow_content is null");
            return (Criteria) this;
        }

        public Criteria andFollowContentIsNotNull() {
            addCriterion("follow_content is not null");
            return (Criteria) this;
        }

        public Criteria andFollowContentEqualTo(String value) {
            addCriterion("follow_content =", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentNotEqualTo(String value) {
            addCriterion("follow_content <>", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentGreaterThan(String value) {
            addCriterion("follow_content >", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentGreaterThanOrEqualTo(String value) {
            addCriterion("follow_content >=", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentLessThan(String value) {
            addCriterion("follow_content <", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentLessThanOrEqualTo(String value) {
            addCriterion("follow_content <=", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentLike(String value) {
            addCriterion("follow_content like", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentNotLike(String value) {
            addCriterion("follow_content not like", value, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentIn(List<String> values) {
            addCriterion("follow_content in", values, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentNotIn(List<String> values) {
            addCriterion("follow_content not in", values, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentBetween(String value1, String value2) {
            addCriterion("follow_content between", value1, value2, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowContentNotBetween(String value1, String value2) {
            addCriterion("follow_content not between", value1, value2, "followContent");
            return (Criteria) this;
        }

        public Criteria andFollowResultIsNull() {
            addCriterion("follow_result is null");
            return (Criteria) this;
        }

        public Criteria andFollowResultIsNotNull() {
            addCriterion("follow_result is not null");
            return (Criteria) this;
        }

        public Criteria andFollowResultEqualTo(String value) {
            addCriterion("follow_result =", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultNotEqualTo(String value) {
            addCriterion("follow_result <>", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultGreaterThan(String value) {
            addCriterion("follow_result >", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultGreaterThanOrEqualTo(String value) {
            addCriterion("follow_result >=", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultLessThan(String value) {
            addCriterion("follow_result <", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultLessThanOrEqualTo(String value) {
            addCriterion("follow_result <=", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultLike(String value) {
            addCriterion("follow_result like", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultNotLike(String value) {
            addCriterion("follow_result not like", value, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultIn(List<String> values) {
            addCriterion("follow_result in", values, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultNotIn(List<String> values) {
            addCriterion("follow_result not in", values, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultBetween(String value1, String value2) {
            addCriterion("follow_result between", value1, value2, "followResult");
            return (Criteria) this;
        }

        public Criteria andFollowResultNotBetween(String value1, String value2) {
            addCriterion("follow_result not between", value1, value2, "followResult");
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

        public Criteria andCustomerNameIsNull() {
            addCriterion("customer_name is null");
            return (Criteria) this;
        }

        public Criteria andCustomerNameIsNotNull() {
            addCriterion("customer_name is not null");
            return (Criteria) this;
        }

        public Criteria andCustomerNameEqualTo(String value) {
            addCriterion("customer_name =", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotEqualTo(String value) {
            addCriterion("customer_name <>", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameGreaterThan(String value) {
            addCriterion("customer_name >", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameGreaterThanOrEqualTo(String value) {
            addCriterion("customer_name >=", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLessThan(String value) {
            addCriterion("customer_name <", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLessThanOrEqualTo(String value) {
            addCriterion("customer_name <=", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameLike(String value) {
            addCriterion("customer_name like", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotLike(String value) {
            addCriterion("customer_name not like", value, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameIn(List<String> values) {
            addCriterion("customer_name in", values, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotIn(List<String> values) {
            addCriterion("customer_name not in", values, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameBetween(String value1, String value2) {
            addCriterion("customer_name between", value1, value2, "customerName");
            return (Criteria) this;
        }

        public Criteria andCustomerNameNotBetween(String value1, String value2) {
            addCriterion("customer_name not between", value1, value2, "customerName");
            return (Criteria) this;
        }

        public Criteria andPromoterIdIsNull() {
            addCriterion("promoter_id is null");
            return (Criteria) this;
        }

        public Criteria andPromoterIdIsNotNull() {
            addCriterion("promoter_id is not null");
            return (Criteria) this;
        }

        public Criteria andPromoterIdEqualTo(String value) {
            addCriterion("promoter_id =", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdNotEqualTo(String value) {
            addCriterion("promoter_id <>", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdGreaterThan(String value) {
            addCriterion("promoter_id >", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdGreaterThanOrEqualTo(String value) {
            addCriterion("promoter_id >=", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdLessThan(String value) {
            addCriterion("promoter_id <", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdLessThanOrEqualTo(String value) {
            addCriterion("promoter_id <=", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdLike(String value) {
            addCriterion("promoter_id like", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdNotLike(String value) {
            addCriterion("promoter_id not like", value, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdIn(List<String> values) {
            addCriterion("promoter_id in", values, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdNotIn(List<String> values) {
            addCriterion("promoter_id not in", values, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdBetween(String value1, String value2) {
            addCriterion("promoter_id between", value1, value2, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterIdNotBetween(String value1, String value2) {
            addCriterion("promoter_id not between", value1, value2, "promoterId");
            return (Criteria) this;
        }

        public Criteria andPromoterNameIsNull() {
            addCriterion("promoter_name is null");
            return (Criteria) this;
        }

        public Criteria andPromoterNameIsNotNull() {
            addCriterion("promoter_name is not null");
            return (Criteria) this;
        }

        public Criteria andPromoterNameEqualTo(String value) {
            addCriterion("promoter_name =", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameNotEqualTo(String value) {
            addCriterion("promoter_name <>", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameGreaterThan(String value) {
            addCriterion("promoter_name >", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameGreaterThanOrEqualTo(String value) {
            addCriterion("promoter_name >=", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameLessThan(String value) {
            addCriterion("promoter_name <", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameLessThanOrEqualTo(String value) {
            addCriterion("promoter_name <=", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameLike(String value) {
            addCriterion("promoter_name like", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameNotLike(String value) {
            addCriterion("promoter_name not like", value, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameIn(List<String> values) {
            addCriterion("promoter_name in", values, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameNotIn(List<String> values) {
            addCriterion("promoter_name not in", values, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameBetween(String value1, String value2) {
            addCriterion("promoter_name between", value1, value2, "promoterName");
            return (Criteria) this;
        }

        public Criteria andPromoterNameNotBetween(String value1, String value2) {
            addCriterion("promoter_name not between", value1, value2, "promoterName");
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