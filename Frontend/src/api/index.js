class Api {
  /* Mediates the interaction with the API through HTTP requests */
  constructor(baseUrl) {
    this.baseUrl = baseUrl;
    this.baseHeaders = {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    };
  }

  static async getAccessToken() {
    const accessToken = window.localStorage.getItem('exchange-ten token');
    if (!accessToken) return null;

    return accessToken;
  }

  async authedHeaders() {
    const accessToken = await Api.getAccessToken();
    if (!accessToken) return this.baseHeaders;
    return {
      ...this.baseHeaders,
      Authorization: accessToken,
    };
  }

  async authFetch(path, { method, body, headers } = { method: 'GET' }) {
    const authedHeaders = await this.authedHeaders();
    return fetch(this.baseUrl + path, {
      method,
      headers: { ...authedHeaders, ...headers },
      ...(body && { body: JSON.stringify(body) }),
    });
  }

  // Login method. Returns true if success, else returns false.
  async login(credentials) {
    return this.authFetch('/login', {
      method: 'POST',
      body: credentials,
    }).then(async (res) => {
      if (res.status === 200) {
        const token = res.headers.get('Authorization');
        window.localStorage.setItem('exchange-ten token', token);
      }

      return res.status === 200;
    });
  }
}

export default new Api(process.env.REACT_APP_API_URL);
