package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class UserPlaceHardwareExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserPlaceHardwareExample() {
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

        public Criteria andUserHardwareIdIsNull() {
            addCriterion("user_hardware_id is null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdIsNotNull() {
            addCriterion("user_hardware_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdEqualTo(String value) {
            addCriterion("user_hardware_id =", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdNotEqualTo(String value) {
            addCriterion("user_hardware_id <>", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdGreaterThan(String value) {
            addCriterion("user_hardware_id >", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_hardware_id >=", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdLessThan(String value) {
            addCriterion("user_hardware_id <", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdLessThanOrEqualTo(String value) {
            addCriterion("user_hardware_id <=", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdLike(String value) {
            addCriterion("user_hardware_id like", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdNotLike(String value) {
            addCriterion("user_hardware_id not like", value, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdIn(List<String> values) {
            addCriterion("user_hardware_id in", values, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdNotIn(List<String> values) {
            addCriterion("user_hardware_id not in", values, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdBetween(String value1, String value2) {
            addCriterion("user_hardware_id between", value1, value2, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareIdNotBetween(String value1, String value2) {
            addCriterion("user_hardware_id not between", value1, value2, "userHardwareId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdIsNull() {
            addCriterion("user_place_id is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdIsNotNull() {
            addCriterion("user_place_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdEqualTo(String value) {
            addCriterion("user_place_id =", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdNotEqualTo(String value) {
            addCriterion("user_place_id <>", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdGreaterThan(String value) {
            addCriterion("user_place_id >", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_place_id >=", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdLessThan(String value) {
            addCriterion("user_place_id <", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdLessThanOrEqualTo(String value) {
            addCriterion("user_place_id <=", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdLike(String value) {
            addCriterion("user_place_id like", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdNotLike(String value) {
            addCriterion("user_place_id not like", value, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdIn(List<String> values) {
            addCriterion("user_place_id in", values, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdNotIn(List<String> values) {
            addCriterion("user_place_id not in", values, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdBetween(String value1, String value2) {
            addCriterion("user_place_id between", value1, value2, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserPlaceIdNotBetween(String value1, String value2) {
            addCriterion("user_place_id not between", value1, value2, "userPlaceId");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameIsNull() {
            addCriterion("user_hardware_name is null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameIsNotNull() {
            addCriterion("user_hardware_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameEqualTo(String value) {
            addCriterion("user_hardware_name =", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameNotEqualTo(String value) {
            addCriterion("user_hardware_name <>", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameGreaterThan(String value) {
            addCriterion("user_hardware_name >", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_hardware_name >=", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameLessThan(String value) {
            addCriterion("user_hardware_name <", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameLessThanOrEqualTo(String value) {
            addCriterion("user_hardware_name <=", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameLike(String value) {
            addCriterion("user_hardware_name like", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameNotLike(String value) {
            addCriterion("user_hardware_name not like", value, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameIn(List<String> values) {
            addCriterion("user_hardware_name in", values, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameNotIn(List<String> values) {
            addCriterion("user_hardware_name not in", values, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameBetween(String value1, String value2) {
            addCriterion("user_hardware_name between", value1, value2, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNameNotBetween(String value1, String value2) {
            addCriterion("user_hardware_name not between", value1, value2, "userHardwareName");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumIsNull() {
            addCriterion("user_hardware_num is null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumIsNotNull() {
            addCriterion("user_hardware_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumEqualTo(Integer value) {
            addCriterion("user_hardware_num =", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumNotEqualTo(Integer value) {
            addCriterion("user_hardware_num <>", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumGreaterThan(Integer value) {
            addCriterion("user_hardware_num >", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_hardware_num >=", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumLessThan(Integer value) {
            addCriterion("user_hardware_num <", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumLessThanOrEqualTo(Integer value) {
            addCriterion("user_hardware_num <=", value, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumIn(List<Integer> values) {
            addCriterion("user_hardware_num in", values, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumNotIn(List<Integer> values) {
            addCriterion("user_hardware_num not in", values, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumBetween(Integer value1, Integer value2) {
            addCriterion("user_hardware_num between", value1, value2, "userHardwareNum");
            return (Criteria) this;
        }

        public Criteria andUserHardwareNumNotBetween(Integer value1, Integer value2) {
            addCriterion("user_hardware_num not between", value1, value2, "userHardwareNum");
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