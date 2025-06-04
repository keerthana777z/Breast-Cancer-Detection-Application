import { render, screen } from '@testing-library/react';
import App from './App';

// Mock axios to avoid actual API calls during tests
jest.mock('axios', () => ({
  post: jest.fn(() => Promise.resolve({ data: { prediction: 'Non-Cancerous' } }))
}));

test('renders breast cancer detection title', () => {
  render(<App />);
  const titleElement = screen.getByText(/Breast Cancer Detection/i);
  expect(titleElement).toBeInTheDocument();
});
