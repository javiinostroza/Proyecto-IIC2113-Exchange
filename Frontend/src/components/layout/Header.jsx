import React from 'react';
import { useHistory } from 'react-router-dom';
import { Layout, Button, Menu } from 'antd';

const { Header: AntdHeader } = Layout;

const Header = () => {
  const history = useHistory();
  const isLogged = window.localStorage.getItem('exchange-ten token') != null;

  const handleLogoutClick = () => {
    window.localStorage.removeItem('exchange-ten token');
    history.push('/');
    window.location.reload();
  };

  const handleHomeClick = () => {
    history.push('/');
    window.location.reload();
  }

  const handleMouseOver = () => {
    let btn = document.getElementById("home-btn");
    btn.style.color = "lightblue"
  }

  const handleMouseOut = () => {
    let btn = document.getElementById("home-btn");
    btn.style.color = "white"
  }

  const handleMenuClick = ({ key }) => history.push(key);

  if (isLogged) {
    return (
      <AntdHeader>
        <div>
          <div>exchange-ten</div>

          <Menu
            theme="dark"
            mode="horizontal"
            defaultSelectedKeys={[history.location.pathname]}
            onClick={handleMenuClick}
          >
            <Menu.Item key="/">Inicio</Menu.Item>
            <Menu.Item key="/transaction">Transacción</Menu.Item>
            <Menu.Item key="/profile">Perfil</Menu.Item>
          </Menu>
        </div>

        <span id="sign-out-btn">
          <Button onClick={handleLogoutClick}>Cerrar sesión</Button>
        </span>
      </AntdHeader>
    );
  }
  return( 
    <AntdHeader>
      <div>
        <div id="home-btn" onClick={handleHomeClick} onMouseOver={handleMouseOver} onMouseOut={handleMouseOut}>exchange-ten</div>
      </div>
    </AntdHeader>
  );
}

export default Header;
