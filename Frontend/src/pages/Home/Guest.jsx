import React from 'react';
import { useHistory } from 'react-router-dom';
import { Button, Row, Col } from 'antd';

import Container from '../../components/layout/Container';

const HomeGuest = () => {
  const history = useHistory();

  const handleLoginClick = () => {
    history.push('/login');
  };
  const handleRegisterClick = () => {
    history.push('/register');
  };

  return (
    <Container>
      <Row>
        <Col span={7} />
        <Col span={5}>
          <Button onClick={handleLoginClick}>Iniciar Sesión</Button>
        </Col>
        <Col span={5}>
          <Button onClick={handleRegisterClick}>Registrarse</Button>
        </Col>
        <Col span={7} />
      </Row>
    </Container>
  );
};

export default HomeGuest;
