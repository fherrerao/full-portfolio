import React from "react"
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Header from "./Header";

const App = () => {  
  return (
    <BrowserRouter>
      <Routes>
        <Route exact path="/" element={<Header />} />
      </Routes>
    </BrowserRouter>
  );  
}

export default App;
