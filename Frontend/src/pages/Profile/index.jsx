import React, { useState } from 'react';
import { Tabs, Card, Table, Row, Col } from 'antd';

import Container from '../../components/layout/Container';
import api from '../../api';

const { TabPane } = Tabs;

const LoggedHome = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [account, setAccount] = useState('');
  const [clpBalance, setCLPBalance] = useState('');
  const [btfBalance, setBTFBalance] = useState('');
  const [bthBalance, setBTHBalance] = useState('');
  const [allTransactions, setAllTransactions] = useState('');
  const [sellTransactions, setSellTransactions] = useState('');
  const [buyTransactions, setBuyTransactions] = useState('');
  const transactionsColumns = [
    {
      title: 'Transacción',
      dataIndex: 'transaction',
      key: 'transaction',
    },
    {
      title: 'Venta / Compra',
      dataIndex: 'transactionType',
      key: 'transactionType',
    },
    {
      title: 'Criptomoneda',
      dataIndex: 'crypto',
      key: 'crypto',
    },
    {
      title: 'Monto (CLP)',
      key: 'amount',
      dataIndex: 'amount',
    },
  ];

  React.useEffect(() => {
    api
      .authFetch('/wallets', { method: 'GET' })
      .then((response) => response.json())
      .then((resp) => {
        const completeName = `${resp.wallet.user.name} ${resp.wallet.user.lastname}`;
        setUsername(completeName);
        setEmail(resp.wallet.user.email);
        setAccount(resp.wallet.id);
        setCLPBalance(resp.wallet.clp);
      });

    api
      .authFetch('/balances', { method: 'GET' })
      .then((response) => response.json())
      .then((resp) => {
        setBTFBalance(resp.balances[0].amount);
        setBTHBalance(resp.balances[1].amount);
      });

    api
      .authFetch('/transactions', { method: 'GET' })
      .then((response) => response.json())
      .then((resp) => {
        const orderedTransactions = resp.transactions.reverse();
        const all = [];
        const sell = [];
        const buy = [];
        let index = orderedTransactions.length;
        orderedTransactions.forEach((trans) => {
          let transAmount;
          let transType;
          if (trans.amount < 0) {
            transType = 'Compra';
            transAmount = trans.amount * -1;
            buy.push({
              transaction: index,
              transactionType: transType,
              crypto: trans.cryptocurrency.name,
              amount: transAmount,
            });
          } else {
            transType = 'Venta';
            transAmount = trans.amount;
            sell.push({
              transaction: index,
              transactionType: transType,
              crypto: trans.cryptocurrency.name,
              amount: transAmount,
            });
          }
          all.push({
            transaction: index,
            transactionType: transType,
            crypto: trans.cryptocurrency.name,
            amount: transAmount,
          });
          index -= 1;
        });
        setAllTransactions(all);
        setSellTransactions(sell);
        setBuyTransactions(buy);
      });
  }, []);

  return (
    <Container>
      <Row>
        <Col span={8} />
        <Col span={8}>
          <div className="site-card-border-less-wrapper">
            <Card size="small" title={username} style={{ width: 250, height: 170 }}>
              <p>
                <span className="contentCard">Email: </span>
                <span className="dataCard">{email}</span>
                <br />
                <span className="contentCard">Account: </span>
                <span className="dataCard">{account}</span>
                <br />
                <span className="contentCard">CLP Balance: </span>
                <span className="dataCard">{clpBalance}</span>
                <br />
                <span className="contentCard"> BTF Balance: </span>
                <span className="dataCard">{btfBalance}</span>
                <br />
                <span className="contentCard">BTH Balance: </span>
                <span className="dataCard">{bthBalance}</span>
              </p>
            </Card>
          </div>
        </Col>
        <Col span={8} />
      </Row>
      <br></br>
      <Row>
        <Col span={24}>
          <div>
            <Row>
              <Col span={4}></Col>
              <Col span={16}>
                <Tabs class="transaction-tables" defaultActiveKey="1" type="card" size="small">
                  <TabPane id="summaryTab1" tab="Transacciones" key="1">
                    <Table
                      dataSource={allTransactions}
                      columns={transactionsColumns}
                      scroll={{ y: 150 }}
                      pagination={false}
                    />
                  </TabPane>
                  <TabPane id="summaryTab2" tab="Ventas" key="2">
                    <Table
                      dataSource={sellTransactions}
                      columns={transactionsColumns}
                      scroll={{ y: 150 }}
                      pagination={false}
                    />
                  </TabPane>
                  <TabPane id="summaryTab3" tab="Compras" key="3">
                    <Table
                      dataSource={buyTransactions}
                      columns={transactionsColumns}
                      scroll={{ y: 150 }}
                      pagination={false}
                    />
                  </TabPane>
                </Tabs>
              </Col>
              <Col span={4}></Col>
            </Row>
          </div>
        </Col>
      </Row>
    </Container>
  );
};

export default LoggedHome;
