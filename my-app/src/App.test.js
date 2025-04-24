import { render, screen } from '@testing-library/react';
import App from './App';

test('renders breast cancer detection title', () => {
  render(<App />);
  const titleElement = screen.getByText(/Breast Cancer Detection/i);
  expect(titleElement).toBeInTheDocument();
});
