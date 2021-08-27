import React from 'react';
import { useHistory } from 'react-router-dom';
import { Button, Form, Input, message, Typography } from 'antd';

import Container from '../../components/layout/Container';
import api from '../../api';

const { Title } = Typography;

const Register = () => {
  const history = useHistory();

  const handleFinish = (values) => {
    api
      .authFetch('/register', { method: 'POST', body: values })
      .then(async (response) => response.json())
      .then(() => {
        message.success('¡Tu cuenta ha sido creada con éxito!');
        history.push('/login');
      });
  };

  return (
    <Container>
      <Title>Crear Cuenta</Title>
      <Form
        layout="vertical"
        initialValues={{ remember: true }}
        onFinish={handleFinish}
        style={{ width: '400px' }}
      >
        <Form.Item
          label="Nombre"
          name={['user', 'name']}
          rules={[{ required: true, message: 'Please input your email!' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Apellido"
          name={['user', 'lastname']}
          rules={[{ required: true, message: 'Please input your email!' }]}
        >
          <Input />
        </Form.Item>

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
            Crear Cuenta
          </Button>
        </Form.Item>
      </Form>
    </Container>
  );
};

export default Register;
