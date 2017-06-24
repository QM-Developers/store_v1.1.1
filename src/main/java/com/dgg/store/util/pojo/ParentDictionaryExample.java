package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ParentDictionaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ParentDictionaryExample() {
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

        public Criteria andParDictIdIsNull() {
            addCriterion("par_dict_id is null");
            return (Criteria) this;
        }

        public Criteria andParDictIdIsNotNull() {
            addCriterion("par_dict_id is not null");
            return (Criteria) this;
        }

        public Criteria andParDictIdEqualTo(String value) {
            addCriterion("par_dict_id =", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdNotEqualTo(String value) {
            addCriterion("par_dict_id <>", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdGreaterThan(String value) {
            addCriterion("par_dict_id >", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdGreaterThanOrEqualTo(String value) {
            addCriterion("par_dict_id >=", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdLessThan(String value) {
            addCriterion("par_dict_id <", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdLessThanOrEqualTo(String value) {
            addCriterion("par_dict_id <=", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdLike(String value) {
            addCriterion("par_dict_id like", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdNotLike(String value) {
            addCriterion("par_dict_id not like", value, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdIn(List<String> values) {
            addCriterion("par_dict_id in", values, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdNotIn(List<String> values) {
            addCriterion("par_dict_id not in", values, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdBetween(String value1, String value2) {
            addCriterion("par_dict_id between", value1, value2, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictIdNotBetween(String value1, String value2) {
            addCriterion("par_dict_id not between", value1, value2, "parDictId");
            return (Criteria) this;
        }

        public Criteria andParDictNameIsNull() {
            addCriterion("par_dict_name is null");
            return (Criteria) this;
        }

        public Criteria andParDictNameIsNotNull() {
            addCriterion("par_dict_name is not null");
            return (Criteria) this;
        }

        public Criteria andParDictNameEqualTo(String value) {
            addCriterion("par_dict_name =", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameNotEqualTo(String value) {
            addCriterion("par_dict_name <>", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameGreaterThan(String value) {
            addCriterion("par_dict_name >", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameGreaterThanOrEqualTo(String value) {
            addCriterion("par_dict_name >=", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameLessThan(String value) {
            addCriterion("par_dict_name <", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameLessThanOrEqualTo(String value) {
            addCriterion("par_dict_name <=", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameLike(String value) {
            addCriterion("par_dict_name like", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameNotLike(String value) {
            addCriterion("par_dict_name not like", value, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameIn(List<String> values) {
            addCriterion("par_dict_name in", values, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameNotIn(List<String> values) {
            addCriterion("par_dict_name not in", values, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameBetween(String value1, String value2) {
            addCriterion("par_dict_name between", value1, value2, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictNameNotBetween(String value1, String value2) {
            addCriterion("par_dict_name not between", value1, value2, "parDictName");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateIsNull() {
            addCriterion("par_dict_create_date is null");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateIsNotNull() {
            addCriterion("par_dict_create_date is not null");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateEqualTo(Date value) {
            addCriterion("par_dict_create_date =", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateNotEqualTo(Date value) {
            addCriterion("par_dict_create_date <>", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateGreaterThan(Date value) {
            addCriterion("par_dict_create_date >", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("par_dict_create_date >=", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateLessThan(Date value) {
            addCriterion("par_dict_create_date <", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("par_dict_create_date <=", value, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateIn(List<Date> values) {
            addCriterion("par_dict_create_date in", values, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateNotIn(List<Date> values) {
            addCriterion("par_dict_create_date not in", values, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateBetween(Date value1, Date value2) {
            addCriterion("par_dict_create_date between", value1, value2, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andParDictCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("par_dict_create_date not between", value1, value2, "parDictCreateDate");
            return (Criteria) this;
        }

        public Criteria andSortIsNull() {
            addCriterion("sort is null");
            return (Criteria) this;
        }

        public Criteria andSortIsNotNull() {
            addCriterion("sort is not null");
            return (Criteria) this;
        }

        public Criteria andSortEqualTo(String value) {
            addCriterion("sort =", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotEqualTo(String value) {
            addCriterion("sort <>", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThan(String value) {
            addCriterion("sort >", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThanOrEqualTo(String value) {
            addCriterion("sort >=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThan(String value) {
            addCriterion("sort <", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThanOrEqualTo(String value) {
            addCriterion("sort <=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLike(String value) {
            addCriterion("sort like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotLike(String value) {
            addCriterion("sort not like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortIn(List<String> values) {
            addCriterion("sort in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotIn(List<String> values) {
            addCriterion("sort not in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortBetween(String value1, String value2) {
            addCriterion("sort between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotBetween(String value1, String value2) {
            addCriterion("sort not between", value1, value2, "sort");
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