module.exports = (rows) => {
  return rows.map((row) => {
    const replacedRow = {};

    for (let key in row) {
      const camelCaseKey = key.replace(/([-_])([a-z])/gi, ($1, $2) => $2.toUpperCase().replace('_', ''));
      replacedRow[camelCaseKey] = row[key];
    }

    return replacedRow;
  });
};