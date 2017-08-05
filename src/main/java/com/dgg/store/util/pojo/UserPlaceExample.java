package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class UserPlaceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserPlaceExample() {
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

        public Criteria andUserPlaceNameIsNull() {
            addCriterion("user_place_name is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameIsNotNull() {
            addCriterion("user_place_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameEqualTo(String value) {
            addCriterion("user_place_name =", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameNotEqualTo(String value) {
            addCriterion("user_place_name <>", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameGreaterThan(String value) {
            addCriterion("user_place_name >", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_place_name >=", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameLessThan(String value) {
            addCriterion("user_place_name <", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameLessThanOrEqualTo(String value) {
            addCriterion("user_place_name <=", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameLike(String value) {
            addCriterion("user_place_name like", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameNotLike(String value) {
            addCriterion("user_place_name not like", value, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameIn(List<String> values) {
            addCriterion("user_place_name in", values, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameNotIn(List<String> values) {
            addCriterion("user_place_name not in", values, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameBetween(String value1, String value2) {
            addCriterion("user_place_name between", value1, value2, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceNameNotBetween(String value1, String value2) {
            addCriterion("user_place_name not between", value1, value2, "userPlaceName");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageIsNull() {
            addCriterion("user_place_acreage is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageIsNotNull() {
            addCriterion("user_place_acreage is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageEqualTo(Integer value) {
            addCriterion("user_place_acreage =", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageNotEqualTo(Integer value) {
            addCriterion("user_place_acreage <>", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageGreaterThan(Integer value) {
            addCriterion("user_place_acreage >", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_place_acreage >=", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageLessThan(Integer value) {
            addCriterion("user_place_acreage <", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageLessThanOrEqualTo(Integer value) {
            addCriterion("user_place_acreage <=", value, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageIn(List<Integer> values) {
            addCriterion("user_place_acreage in", values, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageNotIn(List<Integer> values) {
            addCriterion("user_place_acreage not in", values, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageBetween(Integer value1, Integer value2) {
            addCriterion("user_place_acreage between", value1, value2, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAcreageNotBetween(Integer value1, Integer value2) {
            addCriterion("user_place_acreage not between", value1, value2, "userPlaceAcreage");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumIsNull() {
            addCriterion("user_employee_num is null");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumIsNotNull() {
            addCriterion("user_employee_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumEqualTo(Integer value) {
            addCriterion("user_employee_num =", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumNotEqualTo(Integer value) {
            addCriterion("user_employee_num <>", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumGreaterThan(Integer value) {
            addCriterion("user_employee_num >", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_employee_num >=", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumLessThan(Integer value) {
            addCriterion("user_employee_num <", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumLessThanOrEqualTo(Integer value) {
            addCriterion("user_employee_num <=", value, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumIn(List<Integer> values) {
            addCriterion("user_employee_num in", values, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumNotIn(List<Integer> values) {
            addCriterion("user_employee_num not in", values, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumBetween(Integer value1, Integer value2) {
            addCriterion("user_employee_num between", value1, value2, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserEmployeeNumNotBetween(Integer value1, Integer value2) {
            addCriterion("user_employee_num not between", value1, value2, "userEmployeeNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumIsNull() {
            addCriterion("user_owner_num is null");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumIsNotNull() {
            addCriterion("user_owner_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumEqualTo(Integer value) {
            addCriterion("user_owner_num =", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumNotEqualTo(Integer value) {
            addCriterion("user_owner_num <>", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumGreaterThan(Integer value) {
            addCriterion("user_owner_num >", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_owner_num >=", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumLessThan(Integer value) {
            addCriterion("user_owner_num <", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumLessThanOrEqualTo(Integer value) {
            addCriterion("user_owner_num <=", value, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumIn(List<Integer> values) {
            addCriterion("user_owner_num in", values, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumNotIn(List<Integer> values) {
            addCriterion("user_owner_num not in", values, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumBetween(Integer value1, Integer value2) {
            addCriterion("user_owner_num between", value1, value2, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserOwnerNumNotBetween(Integer value1, Integer value2) {
            addCriterion("user_owner_num not between", value1, value2, "userOwnerNum");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseIsNull() {
            addCriterion("user_already_use is null");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseIsNotNull() {
            addCriterion("user_already_use is not null");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseEqualTo(Integer value) {
            addCriterion("user_already_use =", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseNotEqualTo(Integer value) {
            addCriterion("user_already_use <>", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseGreaterThan(Integer value) {
            addCriterion("user_already_use >", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_already_use >=", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseLessThan(Integer value) {
            addCriterion("user_already_use <", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseLessThanOrEqualTo(Integer value) {
            addCriterion("user_already_use <=", value, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseIn(List<Integer> values) {
            addCriterion("user_already_use in", values, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseNotIn(List<Integer> values) {
            addCriterion("user_already_use not in", values, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseBetween(Integer value1, Integer value2) {
            addCriterion("user_already_use between", value1, value2, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserAlreadyUseNotBetween(Integer value1, Integer value2) {
            addCriterion("user_already_use not between", value1, value2, "userAlreadyUse");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressIsNull() {
            addCriterion("user_place_address is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressIsNotNull() {
            addCriterion("user_place_address is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressEqualTo(String value) {
            addCriterion("user_place_address =", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressNotEqualTo(String value) {
            addCriterion("user_place_address <>", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressGreaterThan(String value) {
            addCriterion("user_place_address >", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressGreaterThanOrEqualTo(String value) {
            addCriterion("user_place_address >=", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressLessThan(String value) {
            addCriterion("user_place_address <", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressLessThanOrEqualTo(String value) {
            addCriterion("user_place_address <=", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressLike(String value) {
            addCriterion("user_place_address like", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressNotLike(String value) {
            addCriterion("user_place_address not like", value, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressIn(List<String> values) {
            addCriterion("user_place_address in", values, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressNotIn(List<String> values) {
            addCriterion("user_place_address not in", values, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressBetween(String value1, String value2) {
            addCriterion("user_place_address between", value1, value2, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAddressNotBetween(String value1, String value2) {
            addCriterion("user_place_address not between", value1, value2, "userPlaceAddress");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaIsNull() {
            addCriterion("user_place_area is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaIsNotNull() {
            addCriterion("user_place_area is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaEqualTo(String value) {
            addCriterion("user_place_area =", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaNotEqualTo(String value) {
            addCriterion("user_place_area <>", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaGreaterThan(String value) {
            addCriterion("user_place_area >", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaGreaterThanOrEqualTo(String value) {
            addCriterion("user_place_area >=", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaLessThan(String value) {
            addCriterion("user_place_area <", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaLessThanOrEqualTo(String value) {
            addCriterion("user_place_area <=", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaLike(String value) {
            addCriterion("user_place_area like", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaNotLike(String value) {
            addCriterion("user_place_area not like", value, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaIn(List<String> values) {
            addCriterion("user_place_area in", values, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaNotIn(List<String> values) {
            addCriterion("user_place_area not in", values, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaBetween(String value1, String value2) {
            addCriterion("user_place_area between", value1, value2, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceAreaNotBetween(String value1, String value2) {
            addCriterion("user_place_area not between", value1, value2, "userPlaceArea");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeIsNull() {
            addCriterion("user_place_type is null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeIsNotNull() {
            addCriterion("user_place_type is not null");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeEqualTo(String value) {
            addCriterion("user_place_type =", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeNotEqualTo(String value) {
            addCriterion("user_place_type <>", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeGreaterThan(String value) {
            addCriterion("user_place_type >", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeGreaterThanOrEqualTo(String value) {
            addCriterion("user_place_type >=", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeLessThan(String value) {
            addCriterion("user_place_type <", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeLessThanOrEqualTo(String value) {
            addCriterion("user_place_type <=", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeLike(String value) {
            addCriterion("user_place_type like", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeNotLike(String value) {
            addCriterion("user_place_type not like", value, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeIn(List<String> values) {
            addCriterion("user_place_type in", values, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeNotIn(List<String> values) {
            addCriterion("user_place_type not in", values, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeBetween(String value1, String value2) {
            addCriterion("user_place_type between", value1, value2, "userPlaceType");
            return (Criteria) this;
        }

        public Criteria andUserPlaceTypeNotBetween(String value1, String value2) {
            addCriterion("user_place_type not between", value1, value2, "userPlaceType");
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