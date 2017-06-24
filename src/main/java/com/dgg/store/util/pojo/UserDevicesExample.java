package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class UserDevicesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserDevicesExample() {
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

        public Criteria andUserDeviceIdIsNull() {
            addCriterion("user_device_id is null");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdIsNotNull() {
            addCriterion("user_device_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdEqualTo(String value) {
            addCriterion("user_device_id =", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdNotEqualTo(String value) {
            addCriterion("user_device_id <>", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdGreaterThan(String value) {
            addCriterion("user_device_id >", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_device_id >=", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdLessThan(String value) {
            addCriterion("user_device_id <", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdLessThanOrEqualTo(String value) {
            addCriterion("user_device_id <=", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdLike(String value) {
            addCriterion("user_device_id like", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdNotLike(String value) {
            addCriterion("user_device_id not like", value, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdIn(List<String> values) {
            addCriterion("user_device_id in", values, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdNotIn(List<String> values) {
            addCriterion("user_device_id not in", values, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdBetween(String value1, String value2) {
            addCriterion("user_device_id between", value1, value2, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceIdNotBetween(String value1, String value2) {
            addCriterion("user_device_id not between", value1, value2, "userDeviceId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameIsNull() {
            addCriterion("user_device_name is null");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameIsNotNull() {
            addCriterion("user_device_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameEqualTo(String value) {
            addCriterion("user_device_name =", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameNotEqualTo(String value) {
            addCriterion("user_device_name <>", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameGreaterThan(String value) {
            addCriterion("user_device_name >", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_device_name >=", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameLessThan(String value) {
            addCriterion("user_device_name <", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameLessThanOrEqualTo(String value) {
            addCriterion("user_device_name <=", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameLike(String value) {
            addCriterion("user_device_name like", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameNotLike(String value) {
            addCriterion("user_device_name not like", value, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameIn(List<String> values) {
            addCriterion("user_device_name in", values, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameNotIn(List<String> values) {
            addCriterion("user_device_name not in", values, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameBetween(String value1, String value2) {
            addCriterion("user_device_name between", value1, value2, "userDeviceName");
            return (Criteria) this;
        }

        public Criteria andUserDeviceNameNotBetween(String value1, String value2) {
            addCriterion("user_device_name not between", value1, value2, "userDeviceName");
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