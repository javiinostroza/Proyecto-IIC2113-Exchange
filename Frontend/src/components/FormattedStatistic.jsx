/* eslint-disable react/jsx-props-no-spreading */
import React from 'react';
import { Statistic } from 'antd';

const FormattedStatistic = (props) => (
  <Statistic decimalSeparator="," groupSeparator="." {...props} />
);

export default FormattedStatistic;
