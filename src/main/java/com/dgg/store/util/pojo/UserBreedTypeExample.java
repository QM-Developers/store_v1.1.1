package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class UserBreedTypeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserBreedTypeExample() {
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

        public Criteria andUserBreedTypeIdIsNull() {
            addCriterion("user_breed_type_id is null");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdIsNotNull() {
            addCriterion("user_breed_type_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdEqualTo(String value) {
            addCriterion("user_breed_type_id =", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdNotEqualTo(String value) {
            addCriterion("user_breed_type_id <>", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdGreaterThan(String value) {
            addCriterion("user_breed_type_id >", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_breed_type_id >=", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdLessThan(String value) {
            addCriterion("user_breed_type_id <", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdLessThanOrEqualTo(String value) {
            addCriterion("user_breed_type_id <=", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdLike(String value) {
            addCriterion("user_breed_type_id like", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdNotLike(String value) {
            addCriterion("user_breed_type_id not like", value, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdIn(List<String> values) {
            addCriterion("user_breed_type_id in", values, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdNotIn(List<String> values) {
            addCriterion("user_breed_type_id not in", values, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdBetween(String value1, String value2) {
            addCriterion("user_breed_type_id between", value1, value2, "userBreedTypeId");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIdNotBetween(String value1, String value2) {
            addCriterion("user_breed_type_id not between", value1, value2, "userBreedTypeId");
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

        public Criteria andUserBreedTypeIsNull() {
            addCriterion("user_breed_type is null");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIsNotNull() {
            addCriterion("user_breed_type is not null");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeEqualTo(String value) {
            addCriterion("user_breed_type =", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeNotEqualTo(String value) {
            addCriterion("user_breed_type <>", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeGreaterThan(String value) {
            addCriterion("user_breed_type >", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeGreaterThanOrEqualTo(String value) {
            addCriterion("user_breed_type >=", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeLessThan(String value) {
            addCriterion("user_breed_type <", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeLessThanOrEqualTo(String value) {
            addCriterion("user_breed_type <=", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeLike(String value) {
            addCriterion("user_breed_type like", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeNotLike(String value) {
            addCriterion("user_breed_type not like", value, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeIn(List<String> values) {
            addCriterion("user_breed_type in", values, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeNotIn(List<String> values) {
            addCriterion("user_breed_type not in", values, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeBetween(String value1, String value2) {
            addCriterion("user_breed_type between", value1, value2, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedTypeNotBetween(String value1, String value2) {
            addCriterion("user_breed_type not between", value1, value2, "userBreedType");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyIsNull() {
            addCriterion("user_breed_variety is null");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyIsNotNull() {
            addCriterion("user_breed_variety is not null");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyEqualTo(String value) {
            addCriterion("user_breed_variety =", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyNotEqualTo(String value) {
            addCriterion("user_breed_variety <>", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyGreaterThan(String value) {
            addCriterion("user_breed_variety >", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyGreaterThanOrEqualTo(String value) {
            addCriterion("user_breed_variety >=", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyLessThan(String value) {
            addCriterion("user_breed_variety <", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyLessThanOrEqualTo(String value) {
            addCriterion("user_breed_variety <=", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyLike(String value) {
            addCriterion("user_breed_variety like", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyNotLike(String value) {
            addCriterion("user_breed_variety not like", value, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyIn(List<String> values) {
            addCriterion("user_breed_variety in", values, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyNotIn(List<String> values) {
            addCriterion("user_breed_variety not in", values, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyBetween(String value1, String value2) {
            addCriterion("user_breed_variety between", value1, value2, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedVarietyNotBetween(String value1, String value2) {
            addCriterion("user_breed_variety not between", value1, value2, "userBreedVariety");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumIsNull() {
            addCriterion("user_breed_num is null");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumIsNotNull() {
            addCriterion("user_breed_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumEqualTo(String value) {
            addCriterion("user_breed_num =", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumNotEqualTo(String value) {
            addCriterion("user_breed_num <>", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumGreaterThan(String value) {
            addCriterion("user_breed_num >", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumGreaterThanOrEqualTo(String value) {
            addCriterion("user_breed_num >=", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumLessThan(String value) {
            addCriterion("user_breed_num <", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumLessThanOrEqualTo(String value) {
            addCriterion("user_breed_num <=", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumLike(String value) {
            addCriterion("user_breed_num like", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumNotLike(String value) {
            addCriterion("user_breed_num not like", value, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumIn(List<String> values) {
            addCriterion("user_breed_num in", values, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumNotIn(List<String> values) {
            addCriterion("user_breed_num not in", values, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumBetween(String value1, String value2) {
            addCriterion("user_breed_num between", value1, value2, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedNumNotBetween(String value1, String value2) {
            addCriterion("user_breed_num not between", value1, value2, "userBreedNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumIsNull() {
            addCriterion("user_sell_num is null");
            return (Criteria) this;
        }

        public Criteria andUserSellNumIsNotNull() {
            addCriterion("user_sell_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserSellNumEqualTo(String value) {
            addCriterion("user_sell_num =", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumNotEqualTo(String value) {
            addCriterion("user_sell_num <>", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumGreaterThan(String value) {
            addCriterion("user_sell_num >", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumGreaterThanOrEqualTo(String value) {
            addCriterion("user_sell_num >=", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumLessThan(String value) {
            addCriterion("user_sell_num <", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumLessThanOrEqualTo(String value) {
            addCriterion("user_sell_num <=", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumLike(String value) {
            addCriterion("user_sell_num like", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumNotLike(String value) {
            addCriterion("user_sell_num not like", value, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumIn(List<String> values) {
            addCriterion("user_sell_num in", values, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumNotIn(List<String> values) {
            addCriterion("user_sell_num not in", values, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumBetween(String value1, String value2) {
            addCriterion("user_sell_num between", value1, value2, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserSellNumNotBetween(String value1, String value2) {
            addCriterion("user_sell_num not between", value1, value2, "userSellNum");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleIsNull() {
            addCriterion("user_breed_style is null");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleIsNotNull() {
            addCriterion("user_breed_style is not null");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleEqualTo(String value) {
            addCriterion("user_breed_style =", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleNotEqualTo(String value) {
            addCriterion("user_breed_style <>", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleGreaterThan(String value) {
            addCriterion("user_breed_style >", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleGreaterThanOrEqualTo(String value) {
            addCriterion("user_breed_style >=", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleLessThan(String value) {
            addCriterion("user_breed_style <", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleLessThanOrEqualTo(String value) {
            addCriterion("user_breed_style <=", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleLike(String value) {
            addCriterion("user_breed_style like", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleNotLike(String value) {
            addCriterion("user_breed_style not like", value, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleIn(List<String> values) {
            addCriterion("user_breed_style in", values, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleNotIn(List<String> values) {
            addCriterion("user_breed_style not in", values, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleBetween(String value1, String value2) {
            addCriterion("user_breed_style between", value1, value2, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserBreedStyleNotBetween(String value1, String value2) {
            addCriterion("user_breed_style not between", value1, value2, "userBreedStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeIsNull() {
            addCriterion("user_fodder_type is null");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeIsNotNull() {
            addCriterion("user_fodder_type is not null");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeEqualTo(String value) {
            addCriterion("user_fodder_type =", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeNotEqualTo(String value) {
            addCriterion("user_fodder_type <>", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeGreaterThan(String value) {
            addCriterion("user_fodder_type >", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeGreaterThanOrEqualTo(String value) {
            addCriterion("user_fodder_type >=", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeLessThan(String value) {
            addCriterion("user_fodder_type <", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeLessThanOrEqualTo(String value) {
            addCriterion("user_fodder_type <=", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeLike(String value) {
            addCriterion("user_fodder_type like", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeNotLike(String value) {
            addCriterion("user_fodder_type not like", value, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeIn(List<String> values) {
            addCriterion("user_fodder_type in", values, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeNotIn(List<String> values) {
            addCriterion("user_fodder_type not in", values, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeBetween(String value1, String value2) {
            addCriterion("user_fodder_type between", value1, value2, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderTypeNotBetween(String value1, String value2) {
            addCriterion("user_fodder_type not between", value1, value2, "userFodderType");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleIsNull() {
            addCriterion("user_fodder_style is null");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleIsNotNull() {
            addCriterion("user_fodder_style is not null");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleEqualTo(String value) {
            addCriterion("user_fodder_style =", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleNotEqualTo(String value) {
            addCriterion("user_fodder_style <>", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleGreaterThan(String value) {
            addCriterion("user_fodder_style >", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleGreaterThanOrEqualTo(String value) {
            addCriterion("user_fodder_style >=", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleLessThan(String value) {
            addCriterion("user_fodder_style <", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleLessThanOrEqualTo(String value) {
            addCriterion("user_fodder_style <=", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleLike(String value) {
            addCriterion("user_fodder_style like", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleNotLike(String value) {
            addCriterion("user_fodder_style not like", value, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleIn(List<String> values) {
            addCriterion("user_fodder_style in", values, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleNotIn(List<String> values) {
            addCriterion("user_fodder_style not in", values, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleBetween(String value1, String value2) {
            addCriterion("user_fodder_style between", value1, value2, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderStyleNotBetween(String value1, String value2) {
            addCriterion("user_fodder_style not between", value1, value2, "userFodderStyle");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumIsNull() {
            addCriterion("user_fodder_num is null");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumIsNotNull() {
            addCriterion("user_fodder_num is not null");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumEqualTo(Integer value) {
            addCriterion("user_fodder_num =", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumNotEqualTo(Integer value) {
            addCriterion("user_fodder_num <>", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumGreaterThan(Integer value) {
            addCriterion("user_fodder_num >", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_fodder_num >=", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumLessThan(Integer value) {
            addCriterion("user_fodder_num <", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumLessThanOrEqualTo(Integer value) {
            addCriterion("user_fodder_num <=", value, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumIn(List<Integer> values) {
            addCriterion("user_fodder_num in", values, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumNotIn(List<Integer> values) {
            addCriterion("user_fodder_num not in", values, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumBetween(Integer value1, Integer value2) {
            addCriterion("user_fodder_num between", value1, value2, "userFodderNum");
            return (Criteria) this;
        }

        public Criteria andUserFodderNumNotBetween(Integer value1, Integer value2) {
            addCriterion("user_fodder_num not between", value1, value2, "userFodderNum");
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