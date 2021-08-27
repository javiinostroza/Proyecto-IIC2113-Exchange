import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import { Card, Tabs, Row, Col, Divider } from 'antd';

import Container from '../../components/layout/Container';
import FormattedStatistic from '../../components/FormattedStatistic';
import api from '../../api';

const style = {
  statisticGrid: {
    width: '50%',
  },
};

const HomeLogged = () => {
const [cryptocurrencies, setCryptocurrencies] = useState([]);
const [market, setMarket] = useState([]);

  React.useEffect(() => {
    api.authFetch('/cryptocurrencies', { method: 'GET' }).then(async (response) => {
      const body = await response.json();
      setCryptocurrencies(body.cryptocurrencies);
    });

    api.authFetch('/markets', { method: 'GET' }).then(async (response) => {
      const body = await response.json();
      setMarket(body[0]);
    });
  }, []);

  return (
    <Container>
      <Row justify="space-around">
        {cryptocurrencies.map((cryptocurrency) => (
          <Col span={10}>
            <Card title={cryptocurrency.name} type="inner">
              <Card.Grid style={style.statisticGrid}>
                <FormattedStatistic title="Compra" value={cryptocurrency.buying_price} prefix="$" />
              </Card.Grid>
              <Card.Grid style={style.statisticGrid}>
                <FormattedStatistic title="Venta" value={cryptocurrency.selling_price} prefix="$" />
              </Card.Grid>
            </Card>
          </Col>
        ))}
      </Row>
      <Divider />
      <h1>Criptomonedas en el mercado</h1>
      {cryptocurrencies.map((cryptocurrency) => {
        const { name } = cryptocurrency;
        return (
          <Col>
            <FormattedStatistic title={`${name}`} value={market[name.toLowerCase()]} />
          </Col>
        );
      })}
    </Container>
  );
};

export default HomeLogged;
