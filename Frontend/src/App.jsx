import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import { Layout } from 'antd';
import './App.scss';

import PrivateRoute from './components/PrivateRoute';
import PublicRoute from './components/PublicRoute';
import Header from './components/layout/Header';
import Home from './pages/Home';
import Profile from './pages/Profile';
import Register from './pages/Register';
import Login from './pages/Login';
import Transaction from './pages/Transaction';

const { Content, Footer } = Layout;

const App = () => {
  return (
    <div className="App">
      <Router>
        <Layout className="layout">
          <Header>exchange-ten</Header>

          <Switch>
            <>
              <Content>
                <Route exact path="/" component={Home} />
                <PrivateRoute exact path="/transaction" component={Transaction} />
                <PrivateRoute exact path="/profile" component={Profile} />
                <PublicRoute exact path="/register" component={Register} />
                <PublicRoute exact path="/login" component={Login} />
              </Content>
            </>
          </Switch>

          <Footer>exchange-ten by Grupo 10 - IIC2173</Footer>
        </Layout>
      </Router>
    </div>
  );
};

export default App;
