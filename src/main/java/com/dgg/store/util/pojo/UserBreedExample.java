package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserBreedExample {
    private Integer pageNum;

    private Integer pageSize;

    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserBreedExample() {
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

        public Criteria andBreedIdIsNull() {
            addCriterion("breed_id is null");
            return (Criteria) this;
        }

        public Criteria andBreedIdIsNotNull() {
            addCriterion("breed_id is not null");
            return (Criteria) this;
        }

        public Criteria andBreedIdEqualTo(String value) {
            addCriterion("breed_id =", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdNotEqualTo(String value) {
            addCriterion("breed_id <>", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdGreaterThan(String value) {
            addCriterion("breed_id >", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdGreaterThanOrEqualTo(String value) {
            addCriterion("breed_id >=", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdLessThan(String value) {
            addCriterion("breed_id <", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdLessThanOrEqualTo(String value) {
            addCriterion("breed_id <=", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdLike(String value) {
            addCriterion("breed_id like", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdNotLike(String value) {
            addCriterion("breed_id not like", value, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdIn(List<String> values) {
            addCriterion("breed_id in", values, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdNotIn(List<String> values) {
            addCriterion("breed_id not in", values, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdBetween(String value1, String value2) {
            addCriterion("breed_id between", value1, value2, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedIdNotBetween(String value1, String value2) {
            addCriterion("breed_id not between", value1, value2, "breedId");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryIsNull() {
            addCriterion("breed_category is null");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryIsNotNull() {
            addCriterion("breed_category is not null");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryEqualTo(String value) {
            addCriterion("breed_category =", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryNotEqualTo(String value) {
            addCriterion("breed_category <>", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryGreaterThan(String value) {
            addCriterion("breed_category >", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryGreaterThanOrEqualTo(String value) {
            addCriterion("breed_category >=", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryLessThan(String value) {
            addCriterion("breed_category <", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryLessThanOrEqualTo(String value) {
            addCriterion("breed_category <=", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryLike(String value) {
            addCriterion("breed_category like", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryNotLike(String value) {
            addCriterion("breed_category not like", value, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryIn(List<String> values) {
            addCriterion("breed_category in", values, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryNotIn(List<String> values) {
            addCriterion("breed_category not in", values, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryBetween(String value1, String value2) {
            addCriterion("breed_category between", value1, value2, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedCategoryNotBetween(String value1, String value2) {
            addCriterion("breed_category not between", value1, value2, "breedCategory");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyIsNull() {
            addCriterion("breed_variety is null");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyIsNotNull() {
            addCriterion("breed_variety is not null");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyEqualTo(String value) {
            addCriterion("breed_variety =", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyNotEqualTo(String value) {
            addCriterion("breed_variety <>", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyGreaterThan(String value) {
            addCriterion("breed_variety >", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyGreaterThanOrEqualTo(String value) {
            addCriterion("breed_variety >=", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyLessThan(String value) {
            addCriterion("breed_variety <", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyLessThanOrEqualTo(String value) {
            addCriterion("breed_variety <=", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyLike(String value) {
            addCriterion("breed_variety like", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyNotLike(String value) {
            addCriterion("breed_variety not like", value, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyIn(List<String> values) {
            addCriterion("breed_variety in", values, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyNotIn(List<String> values) {
            addCriterion("breed_variety not in", values, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyBetween(String value1, String value2) {
            addCriterion("breed_variety between", value1, value2, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedVarietyNotBetween(String value1, String value2) {
            addCriterion("breed_variety not between", value1, value2, "breedVariety");
            return (Criteria) this;
        }

        public Criteria andBreedTypeIsNull() {
            addCriterion("breed_type is null");
            return (Criteria) this;
        }

        public Criteria andBreedTypeIsNotNull() {
            addCriterion("breed_type is not null");
            return (Criteria) this;
        }

        public Criteria andBreedTypeEqualTo(String value) {
            addCriterion("breed_type =", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeNotEqualTo(String value) {
            addCriterion("breed_type <>", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeGreaterThan(String value) {
            addCriterion("breed_type >", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeGreaterThanOrEqualTo(String value) {
            addCriterion("breed_type >=", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeLessThan(String value) {
            addCriterion("breed_type <", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeLessThanOrEqualTo(String value) {
            addCriterion("breed_type <=", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeLike(String value) {
            addCriterion("breed_type like", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeNotLike(String value) {
            addCriterion("breed_type not like", value, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeIn(List<String> values) {
            addCriterion("breed_type in", values, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeNotIn(List<String> values) {
            addCriterion("breed_type not in", values, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeBetween(String value1, String value2) {
            addCriterion("breed_type between", value1, value2, "breedType");
            return (Criteria) this;
        }

        public Criteria andBreedTypeNotBetween(String value1, String value2) {
            addCriterion("breed_type not between", value1, value2, "breedType");
            return (Criteria) this;
        }

        public Criteria andMaleNumIsNull() {
            addCriterion("male_num is null");
            return (Criteria) this;
        }

        public Criteria andMaleNumIsNotNull() {
            addCriterion("male_num is not null");
            return (Criteria) this;
        }

        public Criteria andMaleNumEqualTo(Integer value) {
            addCriterion("male_num =", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumNotEqualTo(Integer value) {
            addCriterion("male_num <>", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumGreaterThan(Integer value) {
            addCriterion("male_num >", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("male_num >=", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumLessThan(Integer value) {
            addCriterion("male_num <", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumLessThanOrEqualTo(Integer value) {
            addCriterion("male_num <=", value, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumIn(List<Integer> values) {
            addCriterion("male_num in", values, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumNotIn(List<Integer> values) {
            addCriterion("male_num not in", values, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumBetween(Integer value1, Integer value2) {
            addCriterion("male_num between", value1, value2, "maleNum");
            return (Criteria) this;
        }

        public Criteria andMaleNumNotBetween(Integer value1, Integer value2) {
            addCriterion("male_num not between", value1, value2, "maleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumIsNull() {
            addCriterion("female_num is null");
            return (Criteria) this;
        }

        public Criteria andFemaleNumIsNotNull() {
            addCriterion("female_num is not null");
            return (Criteria) this;
        }

        public Criteria andFemaleNumEqualTo(Integer value) {
            addCriterion("female_num =", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumNotEqualTo(Integer value) {
            addCriterion("female_num <>", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumGreaterThan(Integer value) {
            addCriterion("female_num >", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("female_num >=", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumLessThan(Integer value) {
            addCriterion("female_num <", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumLessThanOrEqualTo(Integer value) {
            addCriterion("female_num <=", value, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumIn(List<Integer> values) {
            addCriterion("female_num in", values, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumNotIn(List<Integer> values) {
            addCriterion("female_num not in", values, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumBetween(Integer value1, Integer value2) {
            addCriterion("female_num between", value1, value2, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andFemaleNumNotBetween(Integer value1, Integer value2) {
            addCriterion("female_num not between", value1, value2, "femaleNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumIsNull() {
            addCriterion("obstetric_table_num is null");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumIsNotNull() {
            addCriterion("obstetric_table_num is not null");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumEqualTo(Integer value) {
            addCriterion("obstetric_table_num =", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumNotEqualTo(Integer value) {
            addCriterion("obstetric_table_num <>", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumGreaterThan(Integer value) {
            addCriterion("obstetric_table_num >", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("obstetric_table_num >=", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumLessThan(Integer value) {
            addCriterion("obstetric_table_num <", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumLessThanOrEqualTo(Integer value) {
            addCriterion("obstetric_table_num <=", value, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumIn(List<Integer> values) {
            addCriterion("obstetric_table_num in", values, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumNotIn(List<Integer> values) {
            addCriterion("obstetric_table_num not in", values, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumBetween(Integer value1, Integer value2) {
            addCriterion("obstetric_table_num between", value1, value2, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andObstetricTableNumNotBetween(Integer value1, Integer value2) {
            addCriterion("obstetric_table_num not between", value1, value2, "obstetricTableNum");
            return (Criteria) this;
        }

        public Criteria andShedNumIsNull() {
            addCriterion("shed_num is null");
            return (Criteria) this;
        }

        public Criteria andShedNumIsNotNull() {
            addCriterion("shed_num is not null");
            return (Criteria) this;
        }

        public Criteria andShedNumEqualTo(Integer value) {
            addCriterion("shed_num =", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumNotEqualTo(Integer value) {
            addCriterion("shed_num <>", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumGreaterThan(Integer value) {
            addCriterion("shed_num >", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("shed_num >=", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumLessThan(Integer value) {
            addCriterion("shed_num <", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumLessThanOrEqualTo(Integer value) {
            addCriterion("shed_num <=", value, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumIn(List<Integer> values) {
            addCriterion("shed_num in", values, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumNotIn(List<Integer> values) {
            addCriterion("shed_num not in", values, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumBetween(Integer value1, Integer value2) {
            addCriterion("shed_num between", value1, value2, "shedNum");
            return (Criteria) this;
        }

        public Criteria andShedNumNotBetween(Integer value1, Integer value2) {
            addCriterion("shed_num not between", value1, value2, "shedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumIsNull() {
            addCriterion("empty_shed_num is null");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumIsNotNull() {
            addCriterion("empty_shed_num is not null");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumEqualTo(Integer value) {
            addCriterion("empty_shed_num =", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumNotEqualTo(Integer value) {
            addCriterion("empty_shed_num <>", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumGreaterThan(Integer value) {
            addCriterion("empty_shed_num >", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("empty_shed_num >=", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumLessThan(Integer value) {
            addCriterion("empty_shed_num <", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumLessThanOrEqualTo(Integer value) {
            addCriterion("empty_shed_num <=", value, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumIn(List<Integer> values) {
            addCriterion("empty_shed_num in", values, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumNotIn(List<Integer> values) {
            addCriterion("empty_shed_num not in", values, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumBetween(Integer value1, Integer value2) {
            addCriterion("empty_shed_num between", value1, value2, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andEmptyShedNumNotBetween(Integer value1, Integer value2) {
            addCriterion("empty_shed_num not between", value1, value2, "emptyShedNum");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandIsNull() {
            addCriterion("competitive_brand is null");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandIsNotNull() {
            addCriterion("competitive_brand is not null");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandEqualTo(String value) {
            addCriterion("competitive_brand =", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandNotEqualTo(String value) {
            addCriterion("competitive_brand <>", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandGreaterThan(String value) {
            addCriterion("competitive_brand >", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandGreaterThanOrEqualTo(String value) {
            addCriterion("competitive_brand >=", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandLessThan(String value) {
            addCriterion("competitive_brand <", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandLessThanOrEqualTo(String value) {
            addCriterion("competitive_brand <=", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandLike(String value) {
            addCriterion("competitive_brand like", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandNotLike(String value) {
            addCriterion("competitive_brand not like", value, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandIn(List<String> values) {
            addCriterion("competitive_brand in", values, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandNotIn(List<String> values) {
            addCriterion("competitive_brand not in", values, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandBetween(String value1, String value2) {
            addCriterion("competitive_brand between", value1, value2, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andCompetitiveBrandNotBetween(String value1, String value2) {
            addCriterion("competitive_brand not between", value1, value2, "competitiveBrand");
            return (Criteria) this;
        }

        public Criteria andLivestockNumIsNull() {
            addCriterion("livestock_num is null");
            return (Criteria) this;
        }

        public Criteria andLivestockNumIsNotNull() {
            addCriterion("livestock_num is not null");
            return (Criteria) this;
        }

        public Criteria andLivestockNumEqualTo(Integer value) {
            addCriterion("livestock_num =", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumNotEqualTo(Integer value) {
            addCriterion("livestock_num <>", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumGreaterThan(Integer value) {
            addCriterion("livestock_num >", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("livestock_num >=", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumLessThan(Integer value) {
            addCriterion("livestock_num <", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumLessThanOrEqualTo(Integer value) {
            addCriterion("livestock_num <=", value, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumIn(List<Integer> values) {
            addCriterion("livestock_num in", values, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumNotIn(List<Integer> values) {
            addCriterion("livestock_num not in", values, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumBetween(Integer value1, Integer value2) {
            addCriterion("livestock_num between", value1, value2, "livestockNum");
            return (Criteria) this;
        }

        public Criteria andLivestockNumNotBetween(Integer value1, Integer value2) {
            addCriterion("livestock_num not between", value1, value2, "livestockNum");
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

        public Criteria andBreedAgeIsNull() {
            addCriterion("breed_age is null");
            return (Criteria) this;
        }

        public Criteria andBreedAgeIsNotNull() {
            addCriterion("breed_age is not null");
            return (Criteria) this;
        }

        public Criteria andBreedAgeEqualTo(Integer value) {
            addCriterion("breed_age =", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeNotEqualTo(Integer value) {
            addCriterion("breed_age <>", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeGreaterThan(Integer value) {
            addCriterion("breed_age >", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeGreaterThanOrEqualTo(Integer value) {
            addCriterion("breed_age >=", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeLessThan(Integer value) {
            addCriterion("breed_age <", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeLessThanOrEqualTo(Integer value) {
            addCriterion("breed_age <=", value, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeIn(List<Integer> values) {
            addCriterion("breed_age in", values, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeNotIn(List<Integer> values) {
            addCriterion("breed_age not in", values, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeBetween(Integer value1, Integer value2) {
            addCriterion("breed_age between", value1, value2, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedAgeNotBetween(Integer value1, Integer value2) {
            addCriterion("breed_age not between", value1, value2, "breedAge");
            return (Criteria) this;
        }

        public Criteria andBreedScaleIsNull() {
            addCriterion("breed_scale is null");
            return (Criteria) this;
        }

        public Criteria andBreedScaleIsNotNull() {
            addCriterion("breed_scale is not null");
            return (Criteria) this;
        }

        public Criteria andBreedScaleEqualTo(Integer value) {
            addCriterion("breed_scale =", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleNotEqualTo(Integer value) {
            addCriterion("breed_scale <>", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleGreaterThan(Integer value) {
            addCriterion("breed_scale >", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleGreaterThanOrEqualTo(Integer value) {
            addCriterion("breed_scale >=", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleLessThan(Integer value) {
            addCriterion("breed_scale <", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleLessThanOrEqualTo(Integer value) {
            addCriterion("breed_scale <=", value, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleIn(List<Integer> values) {
            addCriterion("breed_scale in", values, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleNotIn(List<Integer> values) {
            addCriterion("breed_scale not in", values, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleBetween(Integer value1, Integer value2) {
            addCriterion("breed_scale between", value1, value2, "breedScale");
            return (Criteria) this;
        }

        public Criteria andBreedScaleNotBetween(Integer value1, Integer value2) {
            addCriterion("breed_scale not between", value1, value2, "breedScale");
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

        public Criteria andJsonIsNull() {
            addCriterion("json is null");
            return (Criteria) this;
        }

        public Criteria andJsonIsNotNull() {
            addCriterion("json is not null");
            return (Criteria) this;
        }

        public Criteria andJsonEqualTo(String value) {
            addCriterion("json =", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonNotEqualTo(String value) {
            addCriterion("json <>", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonGreaterThan(String value) {
            addCriterion("json >", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonGreaterThanOrEqualTo(String value) {
            addCriterion("json >=", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonLessThan(String value) {
            addCriterion("json <", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonLessThanOrEqualTo(String value) {
            addCriterion("json <=", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonLike(String value) {
            addCriterion("json like", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonNotLike(String value) {
            addCriterion("json not like", value, "json");
            return (Criteria) this;
        }

        public Criteria andJsonIn(List<String> values) {
            addCriterion("json in", values, "json");
            return (Criteria) this;
        }

        public Criteria andJsonNotIn(List<String> values) {
            addCriterion("json not in", values, "json");
            return (Criteria) this;
        }

        public Criteria andJsonBetween(String value1, String value2) {
            addCriterion("json between", value1, value2, "json");
            return (Criteria) this;
        }

        public Criteria andJsonNotBetween(String value1, String value2) {
            addCriterion("json not between", value1, value2, "json");
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