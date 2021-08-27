import React from 'react';
import { useHistory } from 'react-router-dom';
import { Button, Form, Input, message, Typography } from 'antd';
import Container from '../../components/layout/Container';
import api from '../../api';

const { Title } = Typography;

const Register = () => {
  const history = useHistory();

  const handleFinish = (values) => {
    api.login(values).then((logged) => {
      if (logged) {
        message.success('¡Inicio de sesión exitoso!');
        window.location.reload();
        history.push('/');
      } else {
        message.error('Credenciales inválidas');
      }
    });
  };

  return (
    <Container>
      <Title>Iniciar Sesión</Title>
      <Form
        layout="vertical"
        initialValues={{ remember: true }}
        onFinish={handleFinish}
        style={{ width: '400px' }}
      >
        <Form.Item
          label="Correo electrónico"
          name={['user', 'email']}
          rules={[{ required: true, message: 'Please input your email!' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Contraseña"
          name={['user', 'password']}
          rules={[{ required: true, message: 'Please input your password!' }]}
        >
          <Input.Password />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit">
            Iniciar Sesión
          </Button>
        </Form.Item>
      </Form>
    </Container>
  );
};

export default Register;
