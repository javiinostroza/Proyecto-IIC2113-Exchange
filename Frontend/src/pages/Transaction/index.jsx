import React, { useState } from 'react';
import { Button, message, Form, Input, Select, Row, Col } from 'antd';
import api from '../../api';

import Container from '../../components/layout/Container';

const Transaction = () => {
  const [needFetch, setNeedFetch] = useState(true);
  const [cryptocurrencies, setCryptocurrencies] = useState([]);
  const [wallet, setWallet] = useState({});

  React.useEffect(() => {
    const fetchData = async () => {
      const cryptocurrenciesResponse = await api.authFetch('/cryptocurrencies', { method: 'GET' });
      const fetchedCryptocurrencies = (await cryptocurrenciesResponse.json()).cryptocurrencies;
      setCryptocurrencies(fetchedCryptocurrencies);

      const walletResponse = await api.authFetch('/wallets', { method: 'GET' });
      const fetchedWallet = (await walletResponse.json()).wallet;
      const balancesResponse = await api.authFetch('/balances', { method: 'GET' });
      const fetchedBalances = await balancesResponse.json();
      setWallet({ ...fetchedWallet, ...fetchedBalances });
    };

    if (needFetch) {
      fetchData();
      setNeedFetch(false);
    }
  }, [needFetch]);

  const handleFinish = (values) => {
    const pond = values.action === 'buy' ? -1 : 1;

    api
      .authFetch('/transactions', {
        method: 'POST',
        body: {
          transaction: {
            amount: parseInt(values.amount * pond, 10),
            cryptocurrency_name: values.cryptocurrency_name,
          },
        },
      })
      .then(async (response) => {
        if (!response.ok) {
          message.warning('Error en la transacción');
        } else {
          setNeedFetch(true);
          message.success('Transacción realizada con éxito');
          window.location.reload();
        }
      });
  };

  return (
    <Container>
      <Row>
        <Col span={8}>
          <p>Balances</p>
          <p>CLP: {wallet.clp}</p>
          {wallet.balances?.map((balance) => (
            <p key={balance.id}>{`${balance.cryptocurrency.name}: ${balance.amount}`}</p>
          ))}
        </Col>

        {cryptocurrencies.map((cryptocurrency) => (
          <Col span={8} key={cryptocurrency.id}>
            <p>{`Precio ${cryptocurrency.name}`}</p>
            <p>{`Venta: ${cryptocurrency.selling_price} CLP`}</p>
            <p>{`Compra: ${cryptocurrency.buying_price} CLP`}</p>
          </Col>
        ))}
      </Row>
      <br />

      <Row justify="center" align="middle">
        <Col span={6} />
        <Col span={18}>
          <h3>Crear Transacción</h3>
          <Form
            labelCol={{ span: 4 }}
            wrapperCol={{ span: 14 }}
            layout="horizontal"
            initialValues={{ remember: true }}
            onFinish={handleFinish}
          >
            <Form.Item label="" name="action" rules={[{ required: true }]}>
              <Select placeholder="Vender / Comprar" allowClear>
                <Select.Option value="sell">Vender</Select.Option>
                <Select.Option value="buy">Comprar</Select.Option>
              </Select>
            </Form.Item>

            <Form.Item label="" name="cryptocurrency_name" rules={[{ required: true }]}>
              <Select placeholder="BTF / BTH">
                <Select.Option value="BTF">BTF</Select.Option>
                <Select.Option value="BTH">BTH</Select.Option>
              </Select>
            </Form.Item>

            <Form.Item label="" name="amount" rules={[{ required: true }]}>
              <Input type="number" min="1" placeholder="Monto CLP" />
            </Form.Item>

            <Form.Item>
              <Button type="primary" htmlType="submit">
                Confirmar
              </Button>
            </Form.Item>
          </Form>
        </Col>
        <Col span={0} />
      </Row>
    </Container>
  );
};
export default Transaction;
